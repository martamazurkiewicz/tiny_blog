<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
    /**
     * @Route("/category", name="category")
     * @param Request $request
     * @return Response
     */
    public function index(Request $request): Response
    {
        $articles = $this->getCategorizedArticles($request->query->get('categoryName'));
        return $this->render('categories/index.html.twig', [
            'controller_name' => 'CareerController',
            'careers' => $articles
        ]);

    }

    private function getCategorizedArticles(string $categoryName){
        $em = $this->getDoctrine()->getManager();
        $category = $em->getRepository(Category::class)->findOneByName($categoryName);
        $articles = $em->getRepository(Article::class)->findBy(['category' => $category]);
    }
}
