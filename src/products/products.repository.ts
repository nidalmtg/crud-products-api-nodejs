import { Brackets, EntityRepository, Repository } from 'typeorm';
import { Product } from './product.entity';
import { CreateProductDto } from './dto/create-product.dto';
import { BadRequestException, NotFoundException } from '@nestjs/common';
import { getProductsFilterDto } from './dto/get-products-filter.dto';

@EntityRepository(Product)
export class ProductsRepository extends Repository<Product> {
  async getProducts(filterDto: getProductsFilterDto): Promise<Product[]> {
    const { type, search } = filterDto;
    const query = this.createQueryBuilder('product').where('1');

    if (type) {
      query.andWhere('product.type = :type', { type: type });
    }

    if (search) {
      query.andWhere(
        new Brackets((qb) => {
          qb.where('product.libelle LIKE :search', {
            search: `%${search}%`,
          }).orWhere('product.description LIKE :search', {
            search: `%${search}%`,
          });
        }),
      );
    }

    return await query.getMany();
  }

  async getProductById(id: string): Promise<Product> {
    const found = await this.findOne(id);

    if (!found) {
      throw new NotFoundException(`Produit avec l\'ID '${id}' introuvable`);
    } else {
      return found;
    }
  }

  async createProduct(createProductDto: CreateProductDto): Promise<Product> {
    const { libelle, description, image, type, quantite } = createProductDto;

    if (description.length > 512) {
      throw new BadRequestException(
        `La description proposée est trop longue. Veuillez ne pas excéder 512 caractères`,
      );
    } else {
      const product = this.create({
        libelle,
        description,
        image,
        type,
        quantite,
      });

      await this.save(product);
      return product;
    }
  }

  async updateProduct(
    id: string,
    editProductDto: CreateProductDto,
  ): Promise<Product> {
    const product = await this.getProductById(id);
    const newProduct = editProductDto;
    product.libelle = newProduct.libelle;
    product.description = newProduct.description;
    if (newProduct.image !== '') {
      product.image = newProduct.image;
    }
    product.type = newProduct.type;
    product.quantite = newProduct.quantite;
    await this.save(product);
    return product;
  }

  async deleteProduct(id: string): Promise<void> {
    const result = await this.delete(id);

    if (result.affected === 0) {
      throw new NotFoundException(`Produit avec l'ID '${id}' introuvable.`);
    }
  }
}
