import { ProductType } from '../product-type.enum';
import { IsEnum, IsNotEmpty, IsNumberString } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  libelle: string;

  @IsNotEmpty()
  description: string;

  image: string;

  @IsNotEmpty()
  @IsEnum(ProductType)
  type: ProductType;

  @IsNotEmpty()
  @IsNumberString()
  quantite: number;
}
