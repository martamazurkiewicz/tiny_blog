<?php

namespace App\Entity;

use App\Repository\ContentPlRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ContentPlRepository::class)
 */
class ContentPl
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Article::class, inversedBy="contentPls")
     * @ORM\JoinColumn(nullable=false)
     */
    private $article;

    /**
     * @ORM\Column(type="string", length=3000)
     */
    private $text;

    /**
     * @ORM\Column(type="integer")
     */
    private $div_number;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getArticle(): ?Article
    {
        return $this->article;
    }

    public function setArticle(?Article $article): self
    {
        $this->article = $article;

        return $this;
    }

    public function getText(): ?string
    {
        return $this->text;
    }

    public function setText(string $text): self
    {
        $this->text = $text;

        return $this;
    }

    public function getDivNumber(): ?int
    {
        return $this->div_number;
    }

    public function setDivNumber(int $div_number): self
    {
        $this->div_number = $div_number;

        return $this;
    }
}
