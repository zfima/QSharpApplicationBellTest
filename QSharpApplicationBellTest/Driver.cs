using System;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.QSharpApplicationBellTest
{
    class Driver
    {
        static void Main(string[] args)
        {
            Task<(long, long)> task = null;
            using (var qsim = new QuantumSimulator())
            {
                task =  BellTest.Run(qsim, 100, Result.One);
                task.Wait();
            }

            Console.WriteLine("Num of zeroes : {0}, num of ones : {1}", task.Result.Item1, task.Result.Item2);
            Console.ReadLine();
        }
    }
}