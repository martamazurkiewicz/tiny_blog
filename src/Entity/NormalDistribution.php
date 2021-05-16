<?php


namespace App\Entity;


class NormalDistribution
{
    private $rangeStart;
    private $sizeOfDataset;
    private $mean;
    private $standardDeviation;
    private $dataset;

    public function __construct()
    {

    }

    public function getRangeStart(): int
    {
        return $this->rangeStart;
    }

    public function setRangeStart($rangeStart): int
    {
        return $this->rangeStart = $rangeStart;
    }

    public function setSizeOfDataset($sizeOfDataset): int
    {
        return $this->sizeOfDataset = $sizeOfDataset;
    }

    public function getSizeOfDataset(): int
    {
        return $this->sizeOfDataset;
    }

    public function getMean(): float
    {
        return $this->mean;
    }

    public function setMean($mean): float
    {
        return $this->mean = $mean;
    }

    public function getStandardDeviation(): float
    {
        return $this->standardDeviation;
    }

    public function setStandardDeviation($standardDeviation): float
    {
        return $this->standardDeviation = $standardDeviation;
    }

    public function getValues(): array
    {
        return $this->dataset;
    }

    public function getArguments(): array
    {
        return range($this->rangeStart, $this->rangeStart + $this->sizeOfDataset, $step = 1);
    }

    public function generateDataset(): void
    {
        $this->dataset = [];
        $arguments = $this->getArguments();
        foreach ($arguments as $x) {
            array_push($this->dataset, $this->getDensity($x));
        }
    }

    private function getDensity($x): float
    {
        $exponent = -0.5 * pow(($x - $this->mean) / $this->standardDeviation, 2);
        return exp($exponent) / ($this->standardDeviation * sqrt(2 * pi()));
    }

    //private void checkDataCorrectness(){}


}