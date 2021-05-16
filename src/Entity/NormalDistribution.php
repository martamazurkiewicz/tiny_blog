<?php


namespace App\Entity;


class NormalDistribution
{
    private $rangeStart;
    private $sizeOfDataset;
    private $mean;
    private $deviation;
    private $dataset;

    public function __construct()
    {

    }

    public function setRangeStart($rangeStart): int
    {
        return $this->rangeStart = $rangeStart;
    }

    public function setSizeOfDataset($sizeOfDataset): int
    {
        return $this->sizeOfDataset = $sizeOfDataset;
    }

    public function setMean($mean): float
    {
        return $this->mean = $mean;
    }

    public function setDeviation($deviation): float
    {
        return $this->deviation = $deviation;
    }

    public function getDataset(): array
    {
        return $this->dataset;
    }

    public function generateDataset(): void
    {
        $this->dataset = [];
        for ($i = $this->rangeStart; $i < $this->sizeOfDataset; $i++) {
            array_push($this->dataset, $this->getDensity($i));
        }
    }

    private function getDensity($x): float
    {
        $exponent = -0.5 * pow(($x - $this->mean) / $this->deviation, 2);
        return exp($exponent) / ($this->deviation * sqrt(2 * pi()));
    }

    //private void checkDataCorrectness(){}
}