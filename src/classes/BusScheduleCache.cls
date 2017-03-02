public class BusScheduleCache {
    private Cache.OrgPartition part;
    
    public BusScheduleCache() {
        part = Cache.Org.getPartition('local.BusSchedule');
    }
    
    public void putSchedule(String busLine, Time[] schedule) {
        part.put(busLine, schedule); 
    }
    
    public Time[] getSchedule(String busLine) {
        Time[] busSchedule = (Time[]) part.get(busLine);
        if(busSchedule != null) return busSchedule;
        return new List<Time>{Time.newInstance(8, 0, 0, 0), Time.newInstance(17, 0,0,0)};
    }
}