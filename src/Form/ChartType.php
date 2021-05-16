<?php


namespace App\Form;


use phpDocumentor\Reflection\Types\Float_;
use phpDocumentor\Reflection\Types\Integer;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class ChartType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('rangeStart', Integer::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '-10'
                ],
                'label_attr' => [
                    'class' => 'sr-only'
                ],
                'required' => false,
                'empty_data' => -10,
            ])
            ->add('sizeOfDataset', Integer::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '400'
                ],
                'label_attr' => [
                    'class' => 'sr-only'
                ],
                'required' => false,
                'empty_data' => 400,
            ])
            ->add('mean', Float_::class, [
                'choices' => $options['departureSpots'],
                'placeholder' => 'From',
                'attr' => [
                    'class' => 'form-control',
                ],
                'label_attr' => [
                    'class' => 'sr-only'
                ],
                'required' => false
            ]);}
}