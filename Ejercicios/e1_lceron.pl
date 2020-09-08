#!/usr/bin/perl
@texto=qw(Lolita, luz de mi vida, fuego de mis entrañas. Pecado mío, alma mía. Lo-lita: la punta de la lengua emprende un viaje de tres pasos desde el borde del paladar para apoyarse, en el tercero, en el borde de los dientes. Lo.Li.Ta. Era Lo, sencillamente Lo, por la mañana, un metro cuarenta y ocho de estatura con pies descalzos. Era Lola con pantalones. Era Dolly en la escuela. Era Dolores cuando firmaba. Pero en mis brazos era siempre Lolita. ¿Tuvo Lolita una precursora? Por cierto que la tuvo. En verdad, Lolita no pudo existir para mí si un verano no hubiese amado a otra... «En un principado junto al mar.» ¿Cuándo? Tantos años antes de que naciera Lolita como tenía yo ese verano. Siempre puede uno contar con un asesino para una prosa fantástica. Señoras y señores del jurado, la prueba número uno es lo que envidiaron los serafines de Poe, los errados, simples serafines de nobles alas. Mirad esta maraña de espinas.);

for($i=0; $i<$ARGV[-1]; $i++){
        my $random_number = int(rand(@texto));
        print  "@texto[$random_number] ";
}
print "\n";
