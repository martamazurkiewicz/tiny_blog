<?php


namespace App\Controller;


use App\Entity\Article;
use App\Entity\Category;
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
        $em = $this->getDoctrine()->getManager();
        $articles = $em->getRepository(Article::class)->findAll();
        $recentArticle = $articles[0];
        $articles = $this->getPairs($articles);

        return $this->render('index/index.html.twig', [
            'article' => $recentArticle,
            'articles' => $articles,
        ]);
    }

    /**
     * @Route("/category", name="category")
     * @param Request $request
     * @return Response
     */
    public function categoryController(Request $request): Response
    {
        $articles = $this->getCategorizedArticles($request->query->get('categoryName'));
        $recentArticle = $articles[0];
        $articles = $this->getPairs($articles);

        return $this->render('index/index.html.twig', [
            'controller_name' => 'CategoryController',
            'article' => $recentArticle,
            'articles' => $articles
        ]);

    }

    private function getCategorizedArticles(string $categoryName){
        $em = $this->getDoctrine()->getManager();
        $category = $em->getRepository(Category::class)->findOneBy(['name_en' => $categoryName]);
        return $em->getRepository(Article::class)->findBy(['category' => $category]);
    }

    private function getPairs(array $articles){
        $size = count($articles);
        $result = array();
        for ($i = 0; $i < $size; $i += 2) {
            if($i+1 < $size) {
                $result[] = [$articles[$i], $articles[$i + 1]];
            }
            else{
                $result[] = [$articles[$i]];
            }
        }
        return $result;
    }
}