import { ProductType } from '../product-type.enum';
import { IsEnum, IsOptional } from 'class-validator';

export class getProductsFilterDto {
  @IsOptional()
  @IsEnum(ProductType)
  type?: ProductType;

  @IsOptional()
  search?: string;
}
