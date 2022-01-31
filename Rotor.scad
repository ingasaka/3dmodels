presnost = 180;

module trojuholnik(){
    t = [[0,0.2],[1,0.5],[1,-0.5],[0,-0.2]];
    translate([0,0,-0.5])linear_extrude(height=1,scale=1.3)polygon(t);
}

//trojuholnik();
module odpocitat(){

for(i=[0:15:360]){
translate([5*cos(i),5*sin(i),0])rotate([60,0,i])translate([0,0.5,0])scale([5,1,10])trojuholnik();
}

}

module finale(){
difference(){
cylinder(3,10,8,center=true,$fn=presnost);
#odpocitat();
}
}

finale();