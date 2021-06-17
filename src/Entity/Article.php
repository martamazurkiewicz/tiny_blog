<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArticleRepository::class)
 */
class Article
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     */
    private $release_date;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $title_pl;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $title_en;

    /**
     * @ORM\OneToOne(targetEntity=Code::class, cascade={"persist", "remove"})
     */
    private $code;

    /**
     * @ORM\OneToMany(targetEntity=ContentPl::class, mappedBy="article", orphanRemoval=true)
     */
    private $contentPls;

    /**
     * @ORM\OneToMany(targetEntity=ContentEn::class, mappedBy="article", orphanRemoval=true)
     */
    private $contentEns;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="article")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    public function __construct()
    {
        $this->contentPls = new ArrayCollection();
        $this->contentEns = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getReleaseDate(): ?\DateTimeInterface
    {
        return $this->release_date;
    }

    public function setReleaseDate(\DateTimeInterface $release_date): self
    {
        $this->release_date = $release_date;

        return $this;
    }

    public function getTitlePl(): ?string
    {
        return $this->title_pl;
    }

    public function setTitlePl(string $title_pl): self
    {
        $this->title_pl = $title_pl;

        return $this;
    }

    public function getTitleEn(): ?string
    {
        return $this->title_en;
    }

    public function setTitleEn(string $title_en): self
    {
        $this->title_en = $title_en;

        return $this;
    }

    public function getCode(): ?Code
    {
        return $this->code;
    }

    public function setCode(?Code $code): self
    {
        $this->code = $code;

        return $this;
    }

    /**
     * @return Collection|ContentPl[]
     */
    public function getContentPls(): Collection
    {
        return $this->contentPls;
    }

    public function addContentPl(ContentPl $contentPl): self
    {
        if (!$this->contentPls->contains($contentPl)) {
            $this->contentPls[] = $contentPl;
            $contentPl->setArticle($this);
        }

        return $this;
    }

    public function removeContentPl(ContentPl $contentPl): self
    {
        if ($this->contentPls->removeElement($contentPl)) {
            // set the owning side to null (unless already changed)
            if ($contentPl->getArticle() === $this) {
                $contentPl->setArticle(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|ContentEn[]
     */
    public function getContentEns(): Collection
    {
        return $this->contentEns;
    }

    public function addContentEn(ContentEn $contentEn): self
    {
        if (!$this->contentEns->contains($contentEn)) {
            $this->contentEns[] = $contentEn;
            $contentEn->setArticle($this);
        }

        return $this;
    }

    public function removeContentEn(ContentEn $contentEn): self
    {
        if ($this->contentEns->removeElement($contentEn)) {
            // set the owning side to null (unless already changed)
            if ($contentEn->getArticle() === $this) {
                $contentEn->setArticle(null);
            }
        }

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }
}
