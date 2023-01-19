
function use_tdmc_enemy(
  _placeMeeting_enemy = function(_x, _y){
    return place_meeting(_x, _y, objEnemyAvoid); //Replace objWall with your object 
  }, 
  _cornerSlip = 0, 
  _slipSpd = .5, 
  _catchupFactor = .5) {
    
  return {
    drawX: id.x,
    drawY: id.y,
    againstWall: { hori: 0, vert: 0 },
    
    __iXSpdLeft: 0,
    __iYSpdLeft: 0,
    __iCornerSlip: _cornerSlip,
    __iCornerSlipSpeedFactor: _slipSpd,
    __iOwner: id,
    __iIgnoreCollision: false,
    __iSpriteCatchupFactor: _catchupFactor,
    
    __iPlaceMeeting_enemy: _placeMeeting_enemy,
    
    __iCornerSlipVert_enemy: function(_dir) {
    	for(var _i = 1; _i <= __iCornerSlip; _i++) {
    		if(!__iPlaceMeeting_enemy(__iOwner.x + _dir, __iOwner.y - _i)) return -1;	
        if(!__iPlaceMeeting_enemy(__iOwner.x + _dir, __iOwner.y + _i)) return 1;
      }
    	return 0;
    },

    __iCornerSlipHori_enemy: function(_dir) {
    	for(var _i = 1; _i <= __iCornerSlip; _i++) {
    		if(!__iPlaceMeeting_enemy(__iOwner.x - _i, __iOwner.y + _dir)) return -1;	
        if(!__iPlaceMeeting_enemy(__iOwner.x + _i, __iOwner.y + _dir)) return 1;
      }
    	return 0;
    },
    
    __iApproach_enemy: function(_start, _target, _step) {
    	if (_start < _target)
    	    return min(_start + _step, _target); 
    	else
    	    return max(_start - _step, _target);
    },
    
    __iUpdateDrawPos_enemy: function() {
      drawX = lerp(drawX, __iOwner.x, __iSpriteCatchupFactor);
      drawY = lerp(drawY, __iOwner.y, __iSpriteCatchupFactor);
    },
    
    __iGtfo_enemy: function() {
      var _precision = 1; //Feel free to adjust this to be higher. 1 is a bit extreme
      if(!__iPlaceMeeting_enemy(__iOwner.x, __iOwner.y)) return;
      var _curRad = _precision;
      var _startX = __iOwner.x;
      var _startY = __iOwner.y;
      while(true) {
        for(var _x = -_curRad; _x <= _curRad; _x += _precision) {
          for(var _y = -_curRad; _y <= _curRad; _y += _precision) {
            if(_x > _curRad && _y > _curRad && _x < _curRad && _y < _curRad) continue;
            __iOwner.x = _startX + _x; 
            __iOwner.y = _startY + _y;
            if(!__iPlaceMeeting_enemy(__iOwner.x, __iOwner.y)) {
              show_debug_message("Got out after " + string(_curRad / _precision) + " iterations");  
              return;
            }
          }
        }
        _curRad += _precision
      }
    },
    
    ///@func spdDir(speed, direction)
    spdDir_enemy: function(_spd, _dir) {
      xSpdYSpd_enemy(lengthdir_x(_spd, _dir), lengthdir_y(_spd, _dir))
    },
    
    ///@func xSpdYSpd(x speed, y speed)
    xSpdYSpd_enemy: function(_xSpd, _ySpd) {
      __iGtfo_enemy();
    	
      againstWall.hori = 0; againstWall.vert = 0;
      
      __iXSpdLeft += _xSpd;
      __iYSpdLeft += _ySpd;
      
      var _againstVert = 0, _againstHori = 0;
      var _timeout = ceil(abs(__iXSpdLeft) + abs(__iYSpdLeft)) * 10;
      var _timeoutTimer = 0;
	    while(abs(__iXSpdLeft) >= 1 || abs(__iYSpdLeft) >= 1) {
    		
        //Hori
        if(abs(__iXSpdLeft) >= 1) {
          var _dir = sign(__iXSpdLeft);
          __iXSpdLeft = __iApproach_enemy(__iXSpdLeft, 0, 1);
          if(__iIgnoreCollision || !__iPlaceMeeting_enemy(__iOwner.x + _dir, __iOwner.y)) {
            __iOwner.x += _dir;
            _againstHori = 0;
          } else {
            _againstHori = _dir;
            if(!__iPlaceMeeting_enemy(__iOwner.x + _dir, __iOwner.y - 1))
              __iYSpdLeft -= 1;
    				else if(!__iPlaceMeeting_enemy(__iOwner.x + _dir, __iOwner.y + 1))
    					__iYSpdLeft += 1;
            else
              againstWall.hori = _dir;  
          }
        } 
        
    		//Vert
        if(abs(__iYSpdLeft) >= 1) {
          var _dir = sign(__iYSpdLeft);
          __iYSpdLeft = __iApproach_enemy(__iYSpdLeft, 0, 1);
          if(__iIgnoreCollision || !__iPlaceMeeting_enemy(__iOwner.x, __iOwner.y + _dir)) {
            __iOwner.y += _dir;
            _againstVert = 0;
          } else {
            _againstVert = _dir;
            if(!__iPlaceMeeting_enemy(__iOwner.x - 1, __iOwner.y + _dir))
              __iXSpdLeft -= 1;
    				else if(!__iPlaceMeeting_enemy(__iOwner.x + 1, __iOwner.y + _dir))
    					__iXSpdLeft += 1;	
            else
              againstWall.vert = _dir;  
          }
        } 
        _timeoutTimer++;
        if(_timeoutTimer > _timeout) {
          __iXSpdLeft = 0;
          __iYSpdLeft = 0;
          break;  
        }
    	}
      
      //Go around Corners
      if(againstWall.hori != 0 && againstWall.vert == 0) {
          __iYSpdLeft += (__iCornerSlipVert_enemy(againstWall.hori) * __iCornerSlipSpeedFactor);
      }
      
      if(againstWall.vert != 0 && againstWall.hori == 0) {
          __iXSpdLeft += (__iCornerSlipHori_enemy(againstWall.vert) * __iCornerSlipSpeedFactor);
      }
      
      if(_againstVert != 0 || _againstHori != 0) {
        againstWall.hori = _againstHori;
        againstWall.vert = _againstVert;
      }
      __iUpdateDrawPos_enemy();
    }
  }
}