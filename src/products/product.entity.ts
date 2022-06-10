import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { ProductType } from './product-type.enum';

@Entity()
export class Product {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ type: 'varchar', length: 128 })
  libelle: string;

  @Column({ type: 'varchar', length: 512 })
  description: string;

  @Column({ type: 'varchar', length: 256 })
  image: string;

  @Column()
  type: ProductType;

  @Column('int')
  quantite: number;
}
