import processing.pdf.*; 

Table table;
int[] nummer = new int[0];
String[] taak = new String[0];
int[] duur = new int[0];

int col;
color[] colarray = new color[6];

void setup() {
  size(400, 400);
  beginRecord(PDF, "Generative_Logo1.pdf");
  background(255);
  smooth();
  colorMode(RGB, 255, 255, 255, 100);

  table = loadTable("data_final.csv", "header");

  colarray[0] = color(255, 0, 255);     //vriendin    - Roze (liefde)
  colarray[1] = color(255, 128, 0);     //werk        - Oranje (determination(vastberadenheid), succes, encouragement (aanmoediging), stimulation)
  colarray[2] = color(100, 220, 40);    //vrije tijd  - Groen (natuur)  
  colarray[3] = color(225, 0, 0);       //sport       - Rood (PSV/Wec)
  colarray[4] = color(255, 255, 0);     //vrienden    - Geel (bier)
  colarray[5] = color(0, 0, 128);       //school      - Navy blue (education)

  loadTaak();
  drawTaak();
}

void loadTaak() {
  for (TableRow row : table.rows ()) {
    taak = append(taak, row.getString("taak"));
    duur = append(duur, row.getInt("duur"));
  }
}

void drawTaak() {
  for (int i=0; i<taak.length; i++) {
    fill(100, 0, 0, 0);
    stroke(colarray[i], 75);
    strokeWeight(duur[i]/2);
    ellipse(width/2-duur[i], height/2-duur[i], 200, 200);
  }
  endRecord();
}

