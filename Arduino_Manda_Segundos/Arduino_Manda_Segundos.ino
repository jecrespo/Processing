void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.println("Segundos:");
  Serial.println(millis()/1000);
  delay(1000);
}
