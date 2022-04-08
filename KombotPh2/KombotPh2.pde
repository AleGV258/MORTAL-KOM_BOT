/**
Integrantes:
  - García Vargas Michell Alejandro - 259663
  - Daniel León Paulin - 260541
Semestre: 6to. Semestre
Grupo: 30
Materia: Desarrollo de Aplicaciones Móviles
MORTAL KOM_BOT: PHASE II
*/

//Variables
PImage dron1, dron2, dron3, dron4, dron5, androide, fondo, prueba; //Variables de Imágenes //BORRAR

//Configuración Fondo
int xFondo1 = 0; //Fondo NO. 1 para formar el efecto Parallax
int xFondo2 = -1280; //Fondo NO. 2 para formar el efecto Parallax

//Configuración Androide
float xAndroide; //Posición x del Androide
float velocidadAndroide = 5; //Velocidad del Androide
boolean direccionAndroide = true; //Saber hacía que dirección se mueve el Androide, true = derecha, false = izquierda

//configuración Dron
float xDron = displayWidth;
float velocidadDron = 7;
int contadorDron = 0;

//Configuración Proyectil de Dron
boolean disparando = false;
float proyectilY;
float proyectilX;
float velocidad = 0;
boolean llegoFinalProyectil = false;
final float gravedad = 0.98;

void settings() {
   size(1280, 800); //Tamaño de la ventana, lienzo
   //size(1280, 800); //Tamaño de la ventana, lienzo
   //fullScreen(); //Pantalla completa, (esc) para salir
}
//Iniciar el programa
void setup(){
  
  //orientation(LANDSCAPE); //Otras configuraciones de pantalla
  dron1 = loadImage("./images/Dron_Movimiento1.png"); //Cargar un frame del Dron
  dron2 = loadImage("./images/Dron_Movimiento2.png"); //Cargar un frame del Dron
  dron3 = loadImage("./images/Dron_Movimiento3.png"); //Cargar un frame del Dron
  dron4 = loadImage("./images/Dron_Ataca.png"); //Cargar un frame del Dron cuando va a atacar
  dron5 = loadImage("./images/Dron_Disparo.png"); //Cargar un frame del Dron cuando dispara
  androide = loadImage("./images/ANDROIDE.png"); //Cargar la imagen del Androide
  fondo = loadImage("./images/bg/2.jpg"); //Cargar la imagen del Fondo
  prueba = loadImage("./images/bg/1.jpg"); //BORRAR
  fondo.resize(1280, 800); //Redimensionar cualquier fondo a la escala del lienzo
}

void draw(){
  
  /* ------------------------------------------------------------NOTAS:---------------------------------------------
  HAY DOS FONDOS DIFERENTES PARA QUE PUEDAS VER LA PROGRESIÓN (CUANDO PONGAMOS SOLO UNO, SE VE MUY FLUIDO), 
  LA IDEA ES DEJAR SOLO UNO, QUITAR EL QUE DICE PRUEBA Y A FONDO2 PONERLE "fondo", 
  HAY 15 FONDOS, SELECCIONA 1, A MI ME GUSTAN EL 2, 9, 10, 14, IGUAL SI ENCUENTRAS OTRO MEJOR, PONLO  
  
  
  YA NO SE PUDE MODIFICAR EL WIDTH NI HEIGTH DEL LIENZO, NI DEL DRON, YA QUE SE DESACOMODA TODO Y HAY QUE VOLVER A HACER CALCULOS DE TODO Y ES MEDIO TARDADO JAJA
  
  
  YO VEO SIEMPRE, CORRECTAMENTE LA ANIMACIÓN DEL DISPARO, NO SE CORTA NI SE TRABA, Y CADA CLIC HACE BIEN LA ANIMACIÓN DEL DISPARO
  
  
  PUSE TODO LO DEL DISPARO DENTRO DE SU IF, SI QUIERES HACER PRUEBAS, SACALO, PERO LO RECOMENDABLE ES QUE YA SE QUEDE AHI XD
  
  
  EL DRON VA A 5 FPS, LO PODEMOS HACER MAS RAPIDO O LENTO, YU DIME SI ASI SE VE BIEN O LO CAMBIO
  -------------------------------------------------------------------------------------------------------------------*/
  
  image(fondo, xFondo1, 0);
  image(prueba, xFondo2, 0);
  xFondo1 = xFondo1 + 1; //Velocidad con la que se mueve la primera imágen del efecto Parallax del fondo
  if(xFondo1 == 1280){ //Cuando llega al borde de la pantalla se reestablece la posición
    xFondo1 = -1280;
  }
  xFondo2 = xFondo2 + 1; //Velocidad con la que se mueve la segunda imágen del efecto Parallax del fondo
  if(xFondo2 == 1280){ //Cuando llega al borde de la pantalla se reestablece la posición
    xFondo2 = -1280;
  }

  //Movimiento de la dirección del Androide
  if(direccionAndroide == true){ //Hacía la derecha
    xAndroide = xAndroide + velocidadAndroide;
  }else{ //Hacía la izquierda
    xAndroide = xAndroide - velocidadAndroide;
  }
  if(xAndroide >= width){ //Cambio de dirección
    direccionAndroide = false;
  }
  if(xAndroide == 0){ //Cambio de dirección
    direccionAndroide = true;
  }
  image(androide, xAndroide, 560, 130, 150);
  
  //Movimiento del Dron
  xDron = xDron - velocidadDron;
  if(xDron <= (0 - 200)){ //Cuando llega al borde, se mueve al otro lado
    xDron = displayWidth - 200;
  }

  //Renderizar por frames al Dron
  if(contadorDron == 40){ contadorDron = 0; }
  if(contadorDron >= 25 && contadorDron < 35){ image(dron5, xDron, -100, 400, 400); }
  if(contadorDron >= 21 && contadorDron < 25 || contadorDron >= 35 && contadorDron < 40 ){ image(dron4, xDron, -100, 400, 400); }
  if(contadorDron == 20){ contadorDron = 0; }
  if(contadorDron >= 10 && contadorDron < 15){ image(dron3, xDron, -96, 400, 400); }
  if(contadorDron >= 5 && contadorDron < 10 || contadorDron >= 15 && contadorDron < 20 ){ image(dron2, xDron, -100, 400, 400); }
  if(contadorDron >= 0 && contadorDron < 5){ image(dron1, xDron, -100, 400, 400); }
  contadorDron = contadorDron + 1;
  
  //Proyectil Dron  
  if(disparando){
    if(llegoFinalProyectil == false){
      velocidad = velocidad + gravedad;
      proyectilY = proyectilY + velocidad; 
    }         
    if(proyectilY > height){                    
      llegoFinalProyectil = true;                        
    }         
    ellipse(proyectilX, proyectilY, 20, 20); //Imagen de Proyectil
    
    //Verificacion de que el Proyectil sí intersecto a Androide
    if((proyectilX < xAndroide + 130 && proyectilX > xAndroide) && (proyectilY > 560 && proyectilY < 600)){
      text("Disparo Exitoso", 100, 100);
      textSize(40);
      llegoFinalProyectil = true; 
    }    
  }  
}


void mouseClicked() {
  if(mouseX < xDron + 400 && mouseX > xDron && mouseY > 30 && mouseY < 150 ){//Verifica que se este dando clic en el dron
    //Activar Proyectil de Dron
    contadorDron = 21; //Acceder a la animación de disparo
    velocidad = 0;  
    disparando = true;
    llegoFinalProyectil = false; 
    proyectilY = 150; //Hacer que parezca debajo del dron
    proyectilX = xDron + 200; //Posición donde esta el dron en eje x + la mitad de ancho del dron para que el proyectil salga de enmedio
  } 
  
  //TEMPORALMENTE SE PUEDE CLIQUEAR EN TODA LA PANTALLA PARA QUE DISPARE EL DRON, PERO DEBE IR EN EL IF DE ARRIBA
  // SOLO QUE A VECES SIENTO QUE NO FUNCIONA BIEN EL CLIC, NO SE SI TE PASA LO MISMO
  print("PROYECTIL: Se cliqueo en " + mouseX + " y " + mouseY +"\n");
}
