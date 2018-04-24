//Pantalla para Arduino con processing

import processing.serial.*;

// The serial port:
Serial myPort;  

// Texto recibido de Arduino a imprimir
String texto = "";

void setup() {
  //se ajusta el tamaNo de la ventana
  size(500, 500);
  // List all the available serial ports:
  printArray(Serial.list());

  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[1], 9600);

  String cabecera = "Usando Puerto: " + Serial.list()[1];
  //pon el fondo de color negro
  background (0);
  //ajusta el tamaNo del texto
  textSize(25);
  text(cabecera, 50, 100);
}

void draw () {
  fill (125);
  rect(40, 170, 400, 200);
  
  if (myPort.available() > 0)
    texto = "";

  while (myPort.available() > 0) {
    int inByte = myPort.read();
    texto = texto +  char(inByte);
    delay(5);
  }
  fill (0);
  textSize(25);
  //define el texto y sus coordenadas
  text(texto, 50, 200);
}
