clear
clc
x=[275 268 192;277 274 190;282 274 188;283 275 178;283 275 181;284 276 179;284 277 173;285 277 170;285 278 166;287 279 164;286 279 165;292 289 159;295 294 156;300 299 154;305 304 154;310 309 151]
for i=1:16
    for j=1:3
        f(i,j)=100000000/(400-190)*(400-x(i,j));
    end
end
y=[221 236 244;216 236 233;211 233 223;207 233 214;203 231 200;207 227 184;204 219 163;202 210 151;203 202 137;211 206 125;218 209 113;222 218 95;243 242 84]
for i=1:13
    for j=1:3
        g(i,j)=100000000/(336-123)*(336-y(i,j));
    end
end
z=[177 173 184 209 205 215 252]
for i=1:7
        h(i)=50/(377-173)*(377-z(i));
end
h=h'