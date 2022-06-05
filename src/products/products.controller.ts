import {
  BadRequestException,
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Query,
  Res,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { ProductsService } from './products.service';
import { CreateProductDto } from './dto/create-product.dto';
import { getProductsFilterDto } from './dto/get-products-filter.dto';
import { Product } from './product.entity';
import { ProductType } from './product-type.enum';
import { Express, Response } from 'express';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { AuthGuard } from '@nestjs/passport';

@Controller('products')
@UseGuards(AuthGuard())
export class ProductsController {
  constructor(private productsService: ProductsService) {}

  @Get('types')
  getProductTypes(): string[] {
    return Object.values(ProductType);
  }

  @Get()
  getProducts(@Query() filterDto: getProductsFilterDto): Promise<Product[]> {
    // s'il y a un filtre, appelle productsService.getProductsWithFilters
    // sinon, retourne tous les produits
    return this.productsService.getProducts(filterDto);
  }

  @Get('/:id')
  getProductById(@Param('id') id: string): Promise<Product> {
    return this.productsService.getProductById(id);
  }

  @Post()
  createProduct(@Body() createProductDto: CreateProductDto): Promise<Product> {
    return this.productsService.createProduct(createProductDto);
  }

  @Patch('/:id')
  updateProduct(
    @Param('id') id: string,
    @Body() editProductDto: CreateProductDto,
  ): Promise<Product> {
    return this.productsService.updateProduct(id, editProductDto);
  }

  @Delete('/:id')
  deleteProduct(@Param('id') id: string): Promise<void> {
    return this.productsService.deleteProduct(id);
  }

  @Post('upload-image')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './img',
        filename: (req, file, cb) => {
          /*const filename = file.originalname.split('.')[0];
          const fileExt = file.originalname.split('.')[1];
          const newFileName =
            filename.split('.').join('_') + '_' + Date.now() + '.' + fileExt;
          */
          cb(null, file.originalname);
        },
      }),
      fileFilter: (req, file, cb) => {
        if (!file.originalname.match(/\.(jpg|jpeg|png|svg)$/))
          return cb(null, false);
        return cb(null, true);
      },
    }),
  )
  sendImage(@UploadedFile() file: Express.Multer.File) {
    if (!file) {
      throw new BadRequestException("Le fichier n'est pas une image");
    } else {
      return {
        filepath: `http://localhost:3000/img/${file.filename}`,
      };
    }
  }

  @Get('img/:filename')
  async getImage(
    @Param('filename') filename,
    @Res() res: Response,
  ): Promise<void> {
    res.sendFile(filename, { root: './img' });
  }
}
