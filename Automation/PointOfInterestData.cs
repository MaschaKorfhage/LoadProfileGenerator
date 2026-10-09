namespace Automation
{
    /// <summary>
    /// Defines a single point of interest that will be turned into a location for traits and affordances.
    /// </summary>
    /// <param name="LocationType">the location whose role this POI will assume, replacing it in traits</param>
    /// <param name="Coordinates">coordinates of the POI</param>
    /// <param name="TimeLimit">an optional timelimit that will be imposed on all affordances at this POI</param>
    /// <param name="AvoidanceWaitTimeMinutes">waiting time in minutes that triggers avoiding this POI on future visits</param>
    /// <param name="MaxAdditionalDistanceKm">maximum extra home-to-POI route distance allowed for an alternative</param>
    public record PointOfInterestData(JsonReference LocationType, Coordinates Coordinates, JsonReference? TimeLimit = null,
        int QueueCapacity = -1, double AvoidanceWaitTimeMinutes = 20, double MaxAdditionalDistanceKm = 1);
}