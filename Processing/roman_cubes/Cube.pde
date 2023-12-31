class Cube {
    public PVector center;
    public float radius;
    public color light;
    public color med;
    public color dark;
    public float angle_offset;
    private float apothem;
    
    public Cube(PVector center, float radius, color light, color med, color dark, float angle_offset) {
        this.center = center;
        this.radius = radius;
        this.apothem = radius * 0.866025403784;
        this.light = light;
        this.med = med;
        this.dark = dark;
        this.angle_offset = angle_offset;
    }
    
    public Cube(PVector center, float radius, color light, color med, color dark) {
        this.center = center;
        this.radius = radius;
        this.apothem = radius * 0.866025403784;
        this.light = light;
        this.med = med;
        this.dark = dark;
        this.angle_offset = 0;
    }
    
    public float getApothem() {
        return apothem;
    }
    
    public void draw() {
        noStroke();
        PVector right = new PVector(this.center.x + cos(angle_offset) * this.radius, this.center.y + sin(angle_offset) * this.radius);
        PVector left = new PVector(this.center.x + cos(PI + angle_offset) * this.radius, this.center.y + sin(PI + angle_offset) * this.radius);
        PVector botright = new PVector(this.center.x + cos(PI / 3 + angle_offset) * this.radius, this.center.y + sin(PI / 3 + angle_offset) * this.radius);
        PVector botleft = new PVector(this.center.x + cos(TWO_PI / 3 + angle_offset) * this.radius, this.center.y + sin(TWO_PI / 3 + angle_offset) * this.radius);
        PVector topleft = new PVector(this.center.x + cos(4 * PI / 3 + angle_offset) * this.radius, this.center.y + sin(4 * PI / 3 + angle_offset) * this.radius);
        PVector topright = new PVector(this.center.x + cos(5 * PI / 3 + angle_offset) * this.radius, this.center.y + sin(5 * PI / 3 + angle_offset) * this.radius);
        
        
        PShape tr = createShape();
        tr.beginShape();
        tr.fill(this.light);
        tr.vertex(this.center.x,this.center.y);
        tr.vertex(right.x,right.y);
        tr.vertex(topright.x,topright.y);
        tr.vertex(topleft.x,topleft.y);
        tr.endShape(CLOSE);
        shape(tr);
        
        PShape br = createShape();
        br.beginShape();
        br.fill(this.dark);
        br.vertex(this.center.x,this.center.y);
        br.vertex(right.x,right.y);
        br.vertex(botright.x,botright.y);
        br.vertex(botleft.x,botleft.y);
        br.endShape(CLOSE);
        shape(br);
        
        PShape bl = createShape();
        bl.beginShape();
        bl.fill(this.med);
        bl.vertex(this.center.x,this.center.y);
        bl.vertex(botleft.x,botleft.y);
        bl.vertex(left.x,left.y);
        bl.vertex(topleft.x,topleft.y);
        bl.endShape(CLOSE);
        shape(bl);
    }
}
