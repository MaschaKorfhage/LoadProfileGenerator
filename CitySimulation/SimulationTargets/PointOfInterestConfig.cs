using Automation;
using CalculationEngine.CitySimulation;

namespace CitySimulation.SimulationTargets
{
    public record PointOfInterestConfig(PointOfInterestId Id, JsonReference LocationType, int QueueCapacity = -1,
        double AvoidanceWaitTimeMinutes = 20, double MaxAdditionalDistanceKm = 1, bool IsPharmacy = false);
}