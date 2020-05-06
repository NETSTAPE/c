int FindOutlier(std::vector<int> arr)
{
    int result;
    int arreven = 0;
    int arrodd = 0;
    
    int even_dig = 0;
    int odd_dig = 0;
    
    for (int i = 0; i < std::size(arr); i++)
    {
        if (arr[i] % 2 == 0)
        {
          even_dig++;
        }
        else
        {
          odd_dig++;
        }
    }
    
    if (even_dig > odd_dig)
        arreven++;
    else
        arrodd++;
    
    if (arreven)
    {
        for (int i = 0; i < std::size(arr); i++)
        {
            if (arr[i] % 2 == 1 || arr[i] % 2 == -1)
            {
                result = arr[i];
                break;
            }
        }
    } 
    else
    {
        for (int i = 0; i < std::size(arr); i++)
        {
            if (arr[i] % 2 == 0)
            {
                result = arr[i];
                break;
            }
        }
    }
    
    return result;
}