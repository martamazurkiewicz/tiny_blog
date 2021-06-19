<?php


namespace App\Controller;


use App\Entity\Article;
use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
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
        $locale = $request->getLocale();
        $em = $this->getDoctrine()->getManager();
        $articles = $em->getRepository(Article::class)->findAll();
        $this->translateArticles($locale, $articles);
        $articles = $this->getPairs($articles);

        return $this->render('index/index.html.twig', [
            'article' => $articles[0][0],
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
        $locale = $request->getLocale();
        $categoryName = $request->query->get('categoryName');
        $articles = $this->getCategorizedArticles($categoryName);
        if (empty($articles)) {
            throw $this->createNotFoundException(
                'No article found for category ' . $categoryName
            );
        }
        $this->translateArticles($locale, $articles);
        $articles = $this->getPairs($articles);

        return $this->render('index/index.html.twig', [
            'article' => $articles[0][0],
            'articles' => $articles
        ]);

    }

    /**
     * @Route("/article/{id}", name="article")
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function articleController(Request $request, int $id)
    {
        $locale = $request->getLocale();
        $article = $this->getDoctrine()
            ->getRepository(Article::class)
            ->find($id);

        if (!$article) {
            throw $this->createNotFoundException(
                'No article found for id ' . $id
            );
        }
        $this->translateArticle($locale, $article);

        return $this->render('article/index.html.twig', [
            'article' => $article,
        ]);
    }

    /**
     * @Route("/lang", name="lang")
     * @param Request $request
     * @return RedirectResponse
     */
    public function changeLocal(Request $request)
    {
        $local = $request->query->get('local');
        $request->getSession()->set('_locale', $local);
        return $this->redirectToRoute('home');
    }

    private function getCategorizedArticles(string $categoryName)
    {
        $em = $this->getDoctrine()->getManager();
        $category = $em->getRepository(Category::class)->findOneBy(['name_en' => $categoryName]);
        return $em->getRepository(Article::class)->findBy(['category' => $category]);
    }

    private function getPairs(array $articles)
    {
        $articles = array_reverse($articles);
        $size = count($articles);
        $result = array();
        for ($i = 0; $i < $size; $i += 2) {
            if ($i + 1 < $size) {
                $result[] = [$articles[$i], $articles[$i + 1]];
            } else {
                $result[] = [$articles[$i]];
            }
        }
        return $result;
    }

    private function translateArticles(string $locale, array $articles)
    {
        foreach ($articles as $article) {
            $this->translateArticle($locale, $article);
        }
    }

    private function translateArticle(string $locale, Article $article)
    {
        $article->setContent();
        if ($locale == 'en') {
            $article->setCategoryName($article->getCategory()->getNameEn());
            $article->setTitle($article->getTitleEn());
            foreach ($article->getContentEns() as $content) {
                $article->addContent($content->getText());
            }
        }
        if ($locale == 'pl_PL') {
            $article->setCategoryName($article->getCategory()->getNamePl());
            $article->setTitle($article->getTitlePl());
            foreach ($article->getContentPls() as $content) {
                $article->addContent($content->getText());
            }
        }
    }
}