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
        if ($normalDistributionForm->isSubmitted() && $normalDistributionForm->isValid()) {
            $normalDistribution->generateDataset();
            $arguments = $normalDistribution->getArguments();
            $values = $normalDistribution->getValues();
            $pairs = [];
            for ($i = 0; $i < count($arguments); $i += 1) {
                array_push($pairs, [$arguments[$i], $values[$i]]);
            }
            return $this->render('index/index.html.twig', [
                'submitted' => true,
                'pairs' => $pairs,
            ]);
        }
        return $this->render('index/index.html.twig', [
            'submitted' => false,
            'distributionForm' => $normalDistributionForm,
        ]);
    }
}