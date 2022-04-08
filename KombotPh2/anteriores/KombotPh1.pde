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
float velocidadAndroide = 5;
boolean direccionAndroide = true;

//configuración Dron
float xDron = displayWidth;
float velocidadDron = 7;

//Configuración Proyectil de Dron
boolean disparando = false;
float proyectilY;
float proyectilX;
float velocidad = 0;
boolean llegoFinalProyectil = false;
final float gravedad = 0.98;

void settings() {
   size(1280, 800);
}
//Iniciar el programa
void setup(){
  //fullScreen(); //Pantalla completa, (esc) para salir
    //Tamaño de la ventana, lienzo
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
  if(xDron <= 0-125){
    xDron = displayWidth - 550;
  }
  image(dron, xDron, 20, 250, 150);
  //ellipse(xDron, 50, 20, 20);
  
  
  //Proyectil Dron  
  if(disparando){
    if(llegoFinalProyectil==false){
      velocidad = velocidad + gravedad;
      proyectilY = proyectilY + velocidad; 
    }         
    if(proyectilY>height){                    
            llegoFinalProyectil = true;                        
    }         
    
    ellipse(proyectilX, proyectilY, 20, 20); //Imagen de Proyectil
    
    //Verificacion de que el Proyectil Sí intersecto a Androide
    if((proyectilX < xAndroide + 130 && proyectilX >xAndroide) && (proyectilY > 560 && proyectilY < 600)){
      text("Disparo Exitoso" , 100, 100);
      textSize(40);
      llegoFinalProyectil = true; 
    }    
  }  
}


void mouseClicked() {
  if(mouseX < xDron + 250 && mouseX > xDron && mouseY> 20 && mouseY < 170 ){//Verifica que se este dando clic en el dron
    print("Clic en dron\n");    
  } 
  
  //TEMPORALMENTE SE PUEDE CLIQUEAR EN TODA LA PANTALLA PARA QUE DISPARE EL DRON, PERO DEBE IR EN EL IF DE ARRIBA
  // SOLO QUE A VECES SIENTO QUE NO FUNCIONA BIEN EL CLIC, NO SE SI TE PASA LO MISMO
  //Activar Proyectil de Dron
  print("PROYECTIL: Se cliqueo en " + mouseX + " y " + mouseY +"\n");
  
  velocidad = 0;  
  disparando = true;
  llegoFinalProyectil = false; 
  proyectilY = 150;//hacer que paresca debajo del dron
  proyectilX = xDron + 125;  //posicion de donde esta el dron en eje x + la mitad de ancho del dron para que el proyectil salga de enmedio
  

}
