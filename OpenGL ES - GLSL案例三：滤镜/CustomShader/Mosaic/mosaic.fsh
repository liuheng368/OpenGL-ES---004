precision highp float;
varying lowp vec2 varyTexCoord;
uniform sampler2D colorMap;
uniform vec2 size;
const vec2 mosaicSize = vec2(32.0, 32.0);

void main(void) {
    vec2 intXY = vec2(size.x * varyTexCoord.x, size.y * varyTexCoord.y);
    vec2 XYMosaic = vec2(floor(intXY.x / mosaicSize.x) * mosaicSize.x, floor(intXY.y / mosaicSize.y) * mosaicSize.y);
    vec4 realColor = texture2D(colorMap, vec2(XYMosaic.x / size.x, XYMosaic.y / size.y));
    gl_FragColor = realColor;
}

//  TB * mosaicSize ：分割矩形的宽 ，TR * mosaicSize：分割矩形的高
//floor(intXY.x / 2) * 2 ==  intXY.x 代表intXY.x为偶数
//floor(intXY.x / 2) * 2 ！=  intXY.x 代表intXY.x为奇数
