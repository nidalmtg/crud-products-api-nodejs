import { Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { getProductsFilterDto } from './dto/get-products-filter.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { ProductsRepository } from './products.repository';
import { Product } from './product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(ProductsRepository)
    private productsRepository: ProductsRepository,
  ) {}

  getProducts(filterDto: getProductsFilterDto): Promise<Product[]> {
    return this.productsRepository.getProducts(filterDto);
  }

  getProductById(id: string): Promise<Product> {
    return this.productsRepository.getProductById(id);
  }

  createProduct(createProductDto: CreateProductDto): Promise<Product> {
    return this.productsRepository.createProduct(createProductDto);
  }

  updateProduct(
    id: string,
    editProductDto: CreateProductDto,
  ): Promise<Product> {
    return this.productsRepository.updateProduct(id, editProductDto);
  }

  deleteProduct(id: string): Promise<void> {
    return this.productsRepository.deleteProduct(id);
  }
}
