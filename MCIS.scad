offset=1;
jj=80;
iPocet=5;
fZak=4.8;
fKrok=0.2;

pp=0;

h=2;
s=1.2;
cb=[4.8,5.0,5.2,5.4,5.6];
module obdm(){
for(i=[0:len(cb)-1]){
ss=(cb[4]+1.5*s);
translate([i*ss,0,h/2])cube([cb[i],cb[i],h+offset],center=true);
//translate([i*ss,0,h/2])cube([cb[i]+s,cb[i]+s,h],center=true);
}
}
module obd(){
for(i=[0:len(cb)-1]){
ss=(cb[4]+1.5*s);
//translate([i*ss,0,h/2])cube([cb[i],cb[i],h+offset],center=true);
translate([i*ss,0,h/2])cube([cb[i]+s,cb[i]+s,h],center=true);
}
}
module cylm(){

for(i=[0:len(cb)-1]){
ss=(cb[4]+1.5*s);
translate([i*ss,0,h/2])cylinder(h+offset,d1=cb[i],d2=cb[i],center=true,$fn=jj);
//translate([i*ss,0,h/2])cylinder(h,d1=cb[i]+s,d2=cb[i]+s,center=true,$fn=jj);
}
}
module cyl(){

for(i=[0:len(cb)-1]){
ss=(cb[4]+1.5*s);
//translate([i*ss,0,h/2])cylinder(h+offset,d1=cb[i],d2=cb[i],center=true,$fn=jj);
translate([i*ss,0,h/2])cylinder(h,d1=cb[i]+s,d2=cb[i]+s,center=true,$fn=jj);
}
}

module final(){
    difference(){
        union(){
            sf=cb[4]*5+10;
            sg=cb[4]*2+8;
            translate([sf/2-(1.5*cb[4]/2),0,0.5])cube([sf,sg,1],center=true);
            #translate([0,5,0])obd();
            #translate([0,-5,0])cyl();
        }

        #translate([0,5,0])obdm();
        #translate([0,-5,0])cylm();
    }
}

final();