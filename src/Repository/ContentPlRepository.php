<?php

namespace App\Repository;

use App\Entity\ContentPl;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ContentPl|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContentPl|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContentPl[]    findAll()
 * @method ContentPl[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContentPlRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContentPl::class);
    }

    // /**
    //  * @return ContentPl[] Returns an array of ContentPl objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ContentPl
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
