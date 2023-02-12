public class customcloneLead{
private lead l;
public customcloneLead(apexpages.standardcontroller std){
this.l = (lead)std.getrecord();
}

public void clonelead(){
lead l1 = new lead();
l1 =l.clone();
insert l1;
}
}