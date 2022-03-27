/**
Integrantes:
  - García Vargas Michell Alejandro - 259663
  - Daniel León Paulin - 260541
Semestre: 6to. Semestre
Grupo: 30
Materia: Desarrollo de Aplicaciones Móviles
MORTAL KOM_BOT: PHASE I
*/

//Variables
PImage dron, androide, fondo;

//Configuración Androide
float xAndroide;
float velocidadAndroide = 15;
boolean direccionAndroide = true;

//configuración Dron
float xDron = displayWidth;
float velocidadDron = 15;

//Iniciar el programa
void setup(){
  //fullScreen(); //Pantalla completa, (esc) para salir
  size(1280, 800); //Tamaño de la ventana, lienzo
  //orientation(LANDSCAPE);  
  dron = loadImage("./images/DRON.png"); //Cargar la imagen del Dron
  androide = loadImage("./images/ANDROIDE.png"); //Cargar la imagen del Androide
  fondo = loadImage("./images/background.jpg"); //Cargar la imagen del Fondo
}

void draw(){
  background(fondo);

  //Movimiento Androide
  if(direccionAndroide == true){
    xAndroide = xAndroide + velocidadAndroide;
  }else{
    xAndroide = xAndroide - velocidadAndroide;
  }
  if(xAndroide >= width){
    direccionAndroide = false;
  }
  if(xAndroide == 0){
    direccionAndroide = true;
  }
  image(androide, xAndroide, 560, 130, 150);
  //ellipse(xAndroide, 500, 20, 20);
  
  //Movimiento Dron
  xDron = xDron - velocidadDron;
  if(xDron <= 0){
    xDron = displayWidth;
  }
  image(dron, xDron, 20, 250, 150);
  //ellipse(xDron, 50, 20, 20);
}
