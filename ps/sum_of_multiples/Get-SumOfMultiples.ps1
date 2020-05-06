function Get-SumOfMultiples($Value)
{
    $sum = 0;
    $iter = 3;
    
    while ($iter -le $Value-1)
    {
        if (-not ($iter % 3))
        {
            $sum += $iter;
        }

        if (-not ($iter % 5))
        {
            if ($iter % 3 -eq $iter % 5) { $iter += 1; continue }
            $sum += $iter;
        }

        $iter += 1;
    }
    
    return $sum;
}