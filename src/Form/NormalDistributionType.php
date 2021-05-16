<?php


namespace App\Form;


use App\Entity\NormalDistribution;
use Doctrine\DBAL\Types\FloatType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class NormalDistributionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('rangeStart', IntegerType::class, [
                'label' => 'Range start',
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '-10'
                ],
                'required' => false,
                'empty_data' => -10,
            ])
            ->add('sizeOfDataset', IntegerType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '20'
                ],
                'required' => false,
                'empty_data' => 20,
            ])
            ->add('mean', NumberType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '0.0'
                ],
                'required' => false,
                'empty_data' => 0.0,
            ])
            ->add('standardDeviation', NumberType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '1.0'
                ],
                'required' => false,
                'empty_data' => 1.0,
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Generate Normal Distribution'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => NormalDistribution::class,
        ]);
    }
}