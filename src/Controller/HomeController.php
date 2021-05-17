<?php


namespace App\Controller;


use App\Entity\NormalDistribution;
use App\Form\NormalDistributionType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $normalDistribution = new NormalDistribution();
        $normalDistributionForm = $this->createForm(NormalDistributionType::class, $normalDistribution);
        $normalDistributionForm->createView();
        $normalDistributionForm->handleRequest($request);
        if ($normalDistributionForm->isSubmitted()) {
            if ($normalDistributionForm->isValid()) {
                return $this->render('index/index.html.twig', [
                    'submitted' => true,
                    'pairs' => $normalDistribution->getPairsArgumentValue(),
                    'sigmas' => $normalDistribution->get3sigmas(),
                ]);
            } elseif ($normalDistributionForm->isValid() === false) {
                foreach ($normalDistributionForm as $fieldName => $formField) {
                    foreach ($formField->getErrors(true) as $error) {
                        $normalDistribution->correctData($fieldName);
                        return $this->render('index/index.html.twig', [
                            'submitted' => true,
                            'pairs' => $normalDistribution->getPairsArgumentValue(),
                            'sigmas' => $normalDistribution->get3sigmas(),
                        ]);
                    }
                }
            }
        }
        return $this->render('index/index.html.twig', [
            'submitted' => false,
            'distributionForm' => $normalDistributionForm,
        ]);
    }
}