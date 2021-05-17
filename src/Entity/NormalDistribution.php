<?php


namespace App\Entity;


class NormalDistribution
{
    private $rangeStart;
    private $sizeOfDataset;
    private $mean;
    private $standardDeviation;
    private $arguments;
    private $values;


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

    private function setArguments(): array
    {
        return $this->arguments = range($this->rangeStart, $this->rangeStart + $this->sizeOfDataset, $step = 1);
    }

    private function setValues(): void
    {
        $this->values = [];
        $isTrimmedLowerBound = false;
        $isTrimmedUpperBound = false;
        foreach ($this->arguments as $x) {
            $density = $this->getDensity($x);
            if ($density != 0) {
                $this->values[$x] = $density;
            } elseif ($isTrimmedLowerBound == false && $x < $this->mean) {
                $this->values[$x] = 0;
                $isTrimmedLowerBound = true;
            } elseif ($isTrimmedUpperBound == false && $x > $this->mean) {
                $this->values[$x] = 0;
                $isTrimmedUpperBound = true;
            }
        }
        if ($isTrimmedLowerBound || $isTrimmedUpperBound) {
            $this->clearArguments();
        }
    }

    private function clearArguments()
    {
        $this->arguments = array_keys($this->values);
    }

    private function getDensity($x): float
    {
        $exponent = -0.5 * pow(($x - $this->mean) / $this->standardDeviation, 2);
        return exp($exponent) / ($this->standardDeviation * sqrt(2 * pi()));
    }

    public function getPairsArgumentValue(): array
    {
        $this->setArguments();
        $this->setValues();
        return $this->values;
    }

    public function get3sigmas()
    {
        $rule = [];
        for ($i = 1; $i <= 3; $i++) {
            $lowerBound = $this->mean - $i * $this->standardDeviation;
            $upperBound = $this->mean + $i * $this->standardDeviation;
            array_push($rule, [$lowerBound, $upperBound]);
        }
        return $rule;
    }

    //private void checkDataCorrectness(){}


}