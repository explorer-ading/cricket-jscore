
var _sunSpiderStartDate = new Date();
/////. Start CORDIC

var AG_CONST = 0.6072529350;

function FIXED(X)
{
  return X * 65536.0;
}

function FLOAT(X)
{
  return X / 65536.0;
}

function DEG2RAD(X)
{
  return 0.017453 * (X);
}

var Angles = [
  FIXED(45.0), FIXED(26.565), FIXED(14.0362), FIXED(7.12502),
  FIXED(3.57633), FIXED(1.78991), FIXED(0.895174), FIXED(0.447614),
  FIXED(0.223811), FIXED(0.111906), FIXED(0.055953),
  FIXED(0.027977) 
              ];

var Target = 28.027;

function cordicsincos(Target) {
    var X;
    var Y;
    var TargetAngle;
    var CurrAngle;
    var Step;
 
    X = FIXED(AG_CONST);         /* AG_CONST * cos(0) */
    Y = 0;                       /* AG_CONST * sin(0) */

    TargetAngle = FIXED(Target);
    CurrAngle = 0;
    for (Step = 0; Step < 12; Step++) {
        var NewX;
        if (TargetAngle > CurrAngle) {
            NewX = X - (Y >> Step);
            Y = (X >> Step) + Y;
            X = NewX;
            CurrAngle += Angles[Step];
        } else {
            NewX = X + (Y >> Step);
            Y = -(X >> Step) + Y;
            X = NewX;
            CurrAngle -= Angles[Step];
        }
    }

    return FLOAT(X) * FLOAT(Y);
}

///// End CORDIC

var total = 0;

function cordic( runs ) {
  var start = new Date();

  for ( var i = 0 ; i < runs ; i++ ) {
      total += cordicsincos(Target);
  }

  var end = new Date();

  return end.getTime() - start.getTime();
}

cordic(25000);


var _sunSpiderInterval = new Date() - _sunSpiderStartDate;
print(_sunSpiderInterval);
