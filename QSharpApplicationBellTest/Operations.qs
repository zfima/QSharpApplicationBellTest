namespace Quantum.QSharpApplicationBellTest
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    
    operation BellTest (count : Int, desired : Result) : (Int, Int) 
    {
        mutable numOfOnes = 0;
        mutable numOfZeroes = 0;

        using(q1 = Qubit())
        {
            for(step in 1..100)
            {
                Set(q1, desired);
                H(q1);

                let result = M(q1);

                if(result == One)
                {
                    set numOfOnes = numOfOnes + 1;
				}
                else 
                {
                    if (result == Zero)
                    {
                        set numOfZeroes = numOfZeroes + 1;
                    }
                }
			}

            Set(q1, Zero);
		}

        return (numOfZeroes, numOfOnes);
    }

    operation Set (q1 : Qubit, desired : Result) : Unit
    {
		if(M(q1) != desired)
        {
            X(q1);  
		}
	}
}
