GDPC                                                                            +   @   res://.import/copper.png-d721f582eadf5aa126c196bebb4f6c34.stex         B      �* ������'?@9i@   res://.import/diamonds.png-3e87b78b7d25885909ae0386d593ba6d.stex      D      �!Q�M��M����<   res://.import/dirt.png-530a2bc40d7e289cf9146c73c9b66275.stex      �       SO�W�s�R[��<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�x      U      -��`�0��x�5�[H   res://.import/indestructable.png-6df66ca355b5a1cc4041953c0a13ea8d.stex  �      �      ˈ�\���{��)GJ�A<   res://.import/iron.png-9a31b06c5a44467d7c2634e2a36d77f4.stex%      C      �&Kw��M��u�N�*w@   res://.import/stone.png-6bf691bdc3afb1e4528543802e86c164.stex    )      �       �t���i�׸���KgD   res://.import/strong_stone.png-8c9daf5e12e189a133a293133316b76f.stex`,      �       ڼ�P��D�o'���)#�$   res://Entities/Block/Block.gd.remap ��      /       �)=��N�v��f�#�    res://Entities/Block/Block.gdc  �      �      ؇Y�K3�]	���x��    res://Entities/Block/Block.tscn �      �      8���X���SzB/���i(   res://Entities/Block/BlockEnums.gd.remap��      4       1�3/
��ve��݋��$   res://Entities/Block/BlockEnums.gdc             )�)JO!���'�R0   res://Entities/Block/Textures/copper.png.import p      �      �) kf�9�65X�{�p4   res://Entities/Block/Textures/diamonds.png.import   `      �      �9:�g��Z�x�A��0   res://Entities/Block/Textures/dirt.png.import          �      �V��{����c��8   res://Entities/Block/Textures/indestructable.png.import P"      �      wP�h:زR��Un0   res://Entities/Block/Textures/iron.png.import   `&      �      ���ϻ�ƙ���B<�0   res://Entities/Block/Textures/stone.png.import  �)      �      ���]b����%���x�8   res://Entities/Block/Textures/strong_stone.png.import   �,      �      k3��_W�v9�"�Ժ�,   res://Entities/ChunkHandler/Chunk.gd.remap  0�      6       M�t'��N����q�2(   res://Entities/ChunkHandler/Chunk.gdc   �/      }       ������(���F˿�(   res://Entities/ChunkHandler/Chunk.tscn  00      �       {J���Ji�*>���1�4   res://Entities/ChunkHandler/ChunkHandler.gd.remap   p�      =       �3���M���S���/],   res://Entities/ChunkHandler/ChunkHandler.gdc�0      F      ����mݺ�%���jT0   res://Entities/ChunkHandler/ChunkHandler.tscn   0D      �      cc���Ն'¬Sl�� (   res://Entities/Player/Player.gd.remap   ��      1       j�;T~|�ô��%    res://Entities/Player/Player.gdc�K      �	      �沽xx�u �z��$   res://Entities/Player/Player.tscn   �U      	      �!J�Z�fu�-C���,   res://Entities/Player/PlayerData.gd.remap   ��      5       v�������鎯)�i$   res://Entities/Player/PlayerData.gdc�^      �      ���ϸ@)���>��_�(   res://Entities/Player/PlayerData.tscn   �`      �       ��� vq���;MC�    res://Maps/CameraMover.gd.remap 0�      +       ����� �_�7u�=   res://Maps/CameraMover.gdc  Pa      Y      h*l��A"����z�    res://Maps/ChunkTestWorld.tscn  �d      �      їI5]�u���./��G   res://Maps/TestWorld.tscn   pf            +ynd^����a�$�AT(   res://TestingScenes/NoiseTest.gd.remap  `�      2       v��H�Ԛ�c0�\$   res://TestingScenes/NoiseTest.gdc   �r            ���X�!��|�ۄ��5$   res://TestingScenes/NoiseTest.tscn  �v      �      l}�����Qcć�ˆv   res://default_env.tres  0x      �       um�`�N��<*ỳ�8   res://icon.png  ��      �      G1?��z�c��vN��   res://icon.png.import   @�      �      �����%��(#AB�   res://project.binary��      �      �Ω=A1��� �)h�            GDSC            ~      ���������τ򶶶�   ������������Ӷ��   ����������ڶ   �����������Ӷ���   �������������Ӷ�   ���¶���   �������ض���   ���������������Ӷ���   ������Ӷ   ������Ӷ   �������Ӷ���   ������������������Ӷ                          Body      Mineral                                      #      $      >   	   D   
   J      P      V      W      `      i      j      s      |      3YY8;�  V�  Y8;�  V�  �  Y8;�  V�  �  Y;�  V�  �  YY0�  P�  V�  R�  V�  R�  V�  R�  V�  �  QX=V�  T�  �  �  T�  �  �  T�  �  �  T�  �  YY0�  P�  V�	  QV�  �
  P�  QT�  �  YY0�  P�  V�	  QV�  �
  P�  QT�  �  Y`       [gd_scene load_steps=4 format=2]

[ext_resource path="res://Entities/Block/Textures/dirt.png" type="Texture" id=1]
[ext_resource path="res://Entities/Block/Block.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 32, 32 )

[node name="Block" type="StaticBody2D"]
script = ExtResource( 2 )

[node name="Body" type="Sprite" parent="."]
scale = Vector2( 2, 2 )
texture = ExtResource( 1 )
centered = false

[node name="Mineral" type="Sprite" parent="."]
scale = Vector2( 2, 2 )
centered = false

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 32, 32 )
shape = SubResource( 1 )
       GDSC   
                ���Ӷ���   ������������Ŷ��   ���ⶶ��   ����󶶶   �����������󶶶�   ��������������   �����������Ŷ���   �����䶶   ��������   �������                               3YY>�  N�  R�  R�  R�  OY>�  N�  R�  R�	  OY`  GDST                 &  PNG �PNG

   IHDR           szz�   sRGB ���   �IDATX��W��0�5x��L�$�����\�J.585���z��P,+4�48��~�����@&��k����/��?��:k��r�@-�����;�(`]4F�=�Z�oq�	l���'�$):�9� kQP�J�,!�u�J0�R��1�e�����b�in��U@I��b��A�JC����) ��:��)�.��*Ī�i���$ ͋7�b.��)    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/copper.png-d721f582eadf5aa126c196bebb4f6c34.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/copper.png"
dest_files=[ "res://.import/copper.png-d721f582eadf5aa126c196bebb4f6c34.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
 GDST                 (  PNG �PNG

   IHDR           szz�   sRGB ���   �IDATX��W��049jj�l�@,�8Y �u�}���b�w� =o��4�8��?�q�~�E �εw��������kծP���Z8��O,�w�Q��h�*{ �d��
���>�:O�	H
R�4Rs�A� �����YB��n�`:���c�� B糡�b�y	n��U@I��b��A�JC�/5�S@�����SR\\U�UU�!�I ��1^��an    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/diamonds.png-3e87b78b7d25885909ae0386d593ba6d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/diamonds.png"
dest_files=[ "res://.import/diamonds.png-3e87b78b7d25885909ae0386d593ba6d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
           GDST                 �   PNG �PNG

   IHDR           ���   sRGB ���   �IDATH���+�0�]h��qD�]8!	eZ҅&��q��ׯ���kg�`�"���P��m���^�r;0q��o� �?�]�
�߂~Ab�o�@���0��N��>���J!@� T� N���l;    IEND�B`�          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/dirt.png-530a2bc40d7e289cf9146c73c9b66275.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/dirt.png"
dest_files=[ "res://.import/dirt.png-530a2bc40d7e289cf9146c73c9b66275.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
       GDST                 �  PNG �PNG

   IHDR           ���   sRGB ���  <IDATH��V/��0�~�C2�h~ ��f�dr�fѯ`rɄ�/@
+�H&�d��L$�0���?�-2�۽׽���M� ��+��R�u{����x�l6�-u]B^� `b
j�&�"N �c�y�����)_jT�  ���t�S��a��q����0[i�E��ADQ�y�D
��X2��.������Q�U["�W@:8��^�e�$�]�5)�Rdw,Də��N�L_�kvH)�؂��v�9�[R��� �� ����X�
�ǃR�~��ҥҌW���,�<�8C�ZpH�$�2�Mc[���z���w���f��j�^/��AvV�F��G�1o���A����~oa��B�n�P] ���|���v�¾��<���3A�h�6�c�zԙH��ۡ��/���b(�"I���n�R�(^���l���8�Eb�h�G]"�C7%����ȲL�;{]�#�:�麎B)uh�c,�	0��8G��gRUU����Ҥ�66!D�զ�L����B�)X��e�Vg�ń����N�cjl5R��ϰ�n�3B�i��墽6�HL)U��?wȹ�)�F    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/indestructable.png-6df66ca355b5a1cc4041953c0a13ea8d.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/indestructable.png"
dest_files=[ "res://.import/indestructable.png-6df66ca355b5a1cc4041953c0a13ea8d.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
         GDST                 '  PNG �PNG

   IHDR           szz�   sRGB ���   �IDATX��W��0=v`�F��Щ��7k�LѾ���b7���,�
�8��sx��zܲ�p�D{r핸�����n��w��Un���c�~T�R~���ƨ�P�A�-��:�m]���Ĝ�� EK#5'�d"
j_��%��V	���{�|D��lhF ��q����=`P�ǰ�{@s����f}
H��2�sJ���+�J ��j"$4	@���-L=��    IEND�B`�             [remap]

importer="texture"
type="StreamTexture"
path="res://.import/iron.png-9a31b06c5a44467d7c2634e2a36d77f4.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/iron.png"
dest_files=[ "res://.import/iron.png-9a31b06c5a44467d7c2634e2a36d77f4.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
       GDST                 �   PNG �PNG

   IHDR           ���   sRGB ���   MIDATH����  CQ��[1L��6j��J�9ݺ    �5 3����q2"I^`���Tb������� |����r�    IEND�B`�             [remap]

importer="texture"
type="StreamTexture"
path="res://.import/stone.png-6bf691bdc3afb1e4528543802e86c164.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/stone.png"
dest_files=[ "res://.import/stone.png-6bf691bdc3afb1e4528543802e86c164.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
    GDST                 s   PNG �PNG

   IHDR           ���   sRGB ���   )IDATH���1  �0���c�T@�I�y�        �������g    IEND�B`� [remap]

importer="texture"
type="StreamTexture"
path="res://.import/strong_stone.png-8c9daf5e12e189a133a293133316b76f.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Entities/Block/Textures/strong_stone.png"
dest_files=[ "res://.import/strong_stone.png-8c9daf5e12e189a133a293133316b76f.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
               GDSC                   ���Ӷ���   ���������   ��������ﶶ�                         	      3YY;�  Y;�  Y`   [gd_scene load_steps=2 format=2]

[ext_resource path="res://Entities/ChunkHandler/Chunk.gd" type="Script" id=1]

[node name="Node" type="Node"]
script = ExtResource( 1 )
      GDSC   6      �   O     ���ӄ�   ����ݶ��   ����ݶ��   ����������   ��������󶶶   ����������   ���������������󶶶�   ��������������������Ӷ��   ������������ݶ��   ����������������Ŷ��   ���������������Ŷ���   �����϶�   �������Ӷ���   �����������Ŷ���   �������������Ŷ�   �����������ض���   �������������Ҷ�   ζ��   ��������������Ҷ   �����������Ҷ���   ϶��   ���������������Ҷ���   ������������ݶ��   ���������   ��������ﶶ�   ������������ݶ��   ���������Ӷ�   �������������Ӷ�   �������Ӷ���   ����������ݶ   ��������Ŷ��   ��������Ŷ��   �������������Ķ�   �������Ӷ���   ���Ӷ���   �������������Ӷ�   �������ض���   ���¶���   ���������������Ӷ���   ������������Ҷ��   ��������Ҷ��   ���������Ӷ�   ��������������Ķ   ���϶���   ����������ƶ   �������������������������϶�   ��������ض��   �������Ŷ���   ������Ķ   ������������������������϶��    ���������������������������Ҷ���    ����������������������������Ҷ��   ��������������������������Ҷ    �����������������������������Ҷ�      res://Entities/Block/Block.tscn    &   res://Entities/ChunkHandler/Chunk.tscn                               &   res://Entities/Block/Textures/dirt.png     '   res://Entities/Block/Textures/stone.png    .   res://Entities/Block/Textures/strong_stone.png     0   res://Entities/Block/Textures/indestructable.png   (   res://Entities/Block/Textures/copper.png   &   res://Entities/Block/Textures/iron.png     *   res://Entities/Block/Textures/diamonds.png        ChunkContainers             finished checking                   	   add_child         ,         Player        Triggers                                                  %   	   *   
   +      ,      /      0      <      =      G      M      S      Y      Z      d      j      p      q      w      x      y      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2     3     4     5   #  6   (  7   )  8   4  9   :  :   <  ;   =  <   F  =   Q  >   W  ?   ]  @   ^  A   q  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V      W   	  X     Y     Z   &  [   3  \   4  ]   =  ^   E  _   F  `   O  a   [  b   \  c   b  d   p  e   q  f   z  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y   �  z   �  {   �  |   �  }   �  ~   �     �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �     �     �     �     �     �     �     �   !  �   "  �   )  �   2  �   3  �   4  �   5  �   ;  �   ?  �   @  �   A  �   B  �   C  �   H  �   M  �   3YY;�  ?PQY;�  ?P�  QYY:�  �  Y:�  �  �  Y:�  �  Y:�  �  �	  YY;�  YY;�  V�  �  P�  R�  QYY:�	  L?P�  QR�  ?P�  QR�  ?P�  QR�  ?P�	  QMYY:�
  L?P�
  QR�  ?P�  QR�  ?P�  QMYY0�  PQV�  �  �  �  �  P�  Q�  �  �  PQYY0�  PQV�  ;�  �  T�  PQ�  �  ;�  �  T�  �  �  ;�  �  T�  �  �  ;�  �  T�  �  �  ;�  �  T�  �  �  �  �  �  )�  �  V�  &P�  T�  �  �  �  T�  	�  �  �  T�  	�  �  �  T�  �  QV�  �  P�  T�  R�  T�  Q�  �  )�  �K  P�  R�  �  QV�  )�  �K  P�  R�  �  QV�  ;�  �  P�  R�  Q�  &�  T�  P�  QV�  �  P�  R�  Q�  �?  P�  QYY0�  P;�  R;�  QV�  &�  	�  V�  .�  �  ;�   �  T�!  PQ�  �   T�"  �  P�  R�  Q�  �   T�  �  �  �   T�  �  �  �  )�  �K  P�  �  RP�  �  Q�  QV�  )�  �K  P�  �  RP�  �  Q�  QV�  ;�#  �  T�!  PQ�  ;�$  �  PP�  �  Q�  RP�  �  Q�  Q�  �#  T�%  P�$  R�  R�  R�  Q�  �#  T�&  P�	  L�  P�  Q�  MQ�  �#  T�"  �  P�  R�  Q�  �  �  �  �   T�'  P�  R�#  Q�  �  �  �  �  �  T�(  P�   QYYYYY0�  P;�  V�  R;�  V�  QX=V�  ;�  �  P�  R�  Q�  &�  T�  P�  QV�  �  T�  P�  QT�)  PQYY0�  P;�  V�  R;�  V�  QX�  V�  .�>  P�  Q�  �>  P�  QYY0�*  P�+  QX�  V�  .�+  T�,  P�  QYY0�-  P�.  V�  QV�  ;�/  �  P�  QT�  PQ�  �  )�0  �/  V�  �0  T�$  T�  �  �  �.  �  YY0�1  P�.  V�  QV�  ;�/  �  P�  QT�  PQ�  �  )�0  �/  V�  �0  T�$  T�  �  �  �.  YY0�2  P�+  QV�  &P�*  P�+  QQV�  YYY�  �  �  T�  �  �  �  PQYYYY�  �-  P�  Q�  �?  P�  QYY0�3  P�+  QV�  &P�*  P�+  QQVYYY�  �  T�  �  �  �  PQYYYY�  �-  P�  Q�  �?  P�  QYY0�4  P�+  QV�  &P�*  P�+  QQVYYY�  �  T�  �  �  �  PQYYYY�  �1  P�  Q�  �?  P�  QYY0�5  P�+  QV�  &P�*  P�+  QQVYYY�  �  T�  �  �  �  PQYYYY�  �1  P�  Q�  �?  P�  QY`          [gd_scene load_steps=4 format=2]

[ext_resource path="res://Entities/ChunkHandler/ChunkHandler.gd" type="Script" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 10, 160 )

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 224, 10 )

[node name="ChunkHandler" type="Node2D"]
position = Vector2( 2.8396, 2.02106 )
script = ExtResource( 1 )

[node name="Triggers" type="Node2D" parent="."]
position = Vector2( 185, 0 )

[node name="LeftTrigger" type="Area2D" parent="Triggers"]
position = Vector2( -221.621, -42.0251 )
collision_layer = 0
collision_mask = 2

[node name="CollisionShape2D" type="CollisionShape2D" parent="Triggers/LeftTrigger"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="RightTrigger" type="Area2D" parent="Triggers"]
position = Vector2( 195.202, -37.6474 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Triggers/RightTrigger"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="TopTrigger" type="Area2D" parent="Triggers"]
position = Vector2( -10.0695, -171.803 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Triggers/TopTrigger"]
shape = SubResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="BottomTrigger" type="Area2D" parent="Triggers"]
position = Vector2( -5.49744, 95.0544 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Triggers/BottomTrigger"]
shape = SubResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="ChunkContainers" type="Node2D" parent="."]
[connection signal="body_entered" from="Triggers/LeftTrigger" to="." method="_on_LeftTrigger_body_entered"]
[connection signal="body_entered" from="Triggers/RightTrigger" to="." method="_on_RightTrigger_body_entered"]
[connection signal="body_entered" from="Triggers/TopTrigger" to="." method="_on_TopTrigger_body_entered"]
[connection signal="body_entered" from="Triggers/BottomTrigger" to="." method="_on_BottomTrigger_body_entered"]
GDSC   #      ?   �     ������������τ�   �������϶���   ����Ҷ��   ������϶   ��������������ض   ������������   ����������������   �����������������䶶   �����϶�   ����������Ŷ   ������������������Ŷ   �������Ŷ���   ����׶��   ������������������Ŷ   ���������������Ŷ���   ����¶��   ��������¶��   �����������ض���   ���������׶�   ��������Ҷ��   ����¶��   ����������������Ҷ��   ϶��   �������������Ķ�   ζ��   ����������Ķ   �������������Ӷ�   ����������������������϶   ������������Ѷ��   �������Ӷ���   ���¶���   ���ڶ���   ���������ڶ�   �����Ӷ�   ��������������������Ҷ��                         �>  {�G�zt?            ui_up         ui_down       ui_left       ui_right            DEBUG/labels/velocity      
   Velocity:         DEBUG/labels/fuel         Fuel:         DEBUG/labels/on_floor      
   On floor:         DEBUG/labels/on_ceiling       On ceiling:       DEBUG/labels/on_wall   	   On wall:          DEBUG/labels/fps      FPS:                                                     $   	   )   
   .      /      0      6      ;      @      A      H      L      M      T      X      \      ]      c      d      k      r      s      |      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -     .     /     0     1      2   *  3   .  4   /  5   5  6   ;  7   <  8   B  9   P  :   `  ;   p  <   �  =   �  >   �  ?   3YY;�  �  PRQY;�  Y;�  Y;�  V�  �  YY:�  �  Y:�  �  Y:�  �  YYY0�  PQV�  �	  P�  Q�  �
  P�  QYY0�  P�  QV�  �  PQYY0�  P�  QV�  �  PQ�  �  PQYY0�  PQV�  �  ;�  �  T�  �  ;�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  T�  �  T�  �  '�  T�  P�  QV�  -�  �  &�  T�  P�  QV�  �  T�  �3  P�  T�  �  R�  Q�  '�  T�  P�	  QV�  �  T�  �4  P�  T�  �  R�  Q�  (V�  &PT�  PQQV�  �  T�  �  P�  T�  RR�  Q�  (V�  �  T�  �  P�  T�  RR�  QYY0�  PQV�  �  T�  �  T�  �  �  �  �  P�  R�  PR�
  QQ�  �  &T�  PQV�  �  PQ�  'T�  PQ�  V�  �  PQYY0�  PQV�  �  T�  YY0�  PQV�  �  P�  QT�  �  �>  P�  Q�  �  P�  QT�  �  �>  P�  T�  Q�  �  P�  QT�  �  �>  P�  PQQ�  �  P�  QT�  �  �>  P�  PQQ�  �  P�  QT�  �  �>  P�   PQQ�  �  P�  QT�  �  �>  P�!  T�"  PQQY`    [gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]
[ext_resource path="res://Entities/Player/Player.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 31.9094, 32.0402 )

[node name="Player" type="KinematicBody2D" groups=[
"Player",
]]
collision_layer = 3
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="DEBUG" type="Control" parent="."]
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ColorRect" type="ColorRect" parent="DEBUG"]
margin_left = 31.0
margin_top = -71.0
margin_right = 194.0
margin_bottom = 44.0
color = Color( 0, 0, 0, 0.254902 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="labels" type="VBoxContainer" parent="DEBUG"]
margin_left = 35.0
margin_top = -63.0
margin_right = 93.0
margin_bottom = 41.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="velocity" type="Label" parent="DEBUG/labels"]
margin_right = 58.0
margin_bottom = 14.0
text = "velocity"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="fuel" type="Label" parent="DEBUG/labels"]
margin_top = 18.0
margin_right = 58.0
margin_bottom = 32.0
text = "fuel"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="on_floor" type="Label" parent="DEBUG/labels"]
margin_top = 36.0
margin_right = 58.0
margin_bottom = 50.0
text = "floor"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="on_ceiling" type="Label" parent="DEBUG/labels"]
margin_top = 54.0
margin_right = 58.0
margin_bottom = 68.0
text = "ceiling"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="on_wall" type="Label" parent="DEBUG/labels"]
margin_top = 72.0
margin_right = 58.0
margin_bottom = 86.0
text = "left wall"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="fps" type="Label" parent="DEBUG/labels"]
margin_top = 90.0
margin_right = 58.0
margin_bottom = 104.0
text = "FPS:"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Camera2D" type="Camera2D" parent="."]
current = true

[node name="BottomDrill" type="RayCast2D" parent="."]
enabled = true
cast_to = Vector2( 0, 33 )

[node name="ForwardDrill" type="RayCast2D" parent="."]
enabled = true
cast_to = Vector2( 33, 0 )
           GDSC   
         H      ���Ӷ���   �����޶�   ���������޶�   ���ڶ���   �������ڶ���   �������϶���   �����������϶���   ��������Ҷ��   �����������ض���   �������������Ķ�   d                   ^                                                      	      
   #      $      +      2      3      :      A      F      YYY3YY;�  V�  Y;�  V�  YY;�  V�  Y;�  V�  YY;�  V�  �  Y;�  V�  �  YY;�  V�  �  Y;�  V�  �  Y;�	  �  Y`              [gd_scene load_steps=2 format=2]

[ext_resource path="res://Entities/Player/PlayerData.gd" type="Script" id=1]

[node name="PlayerData" type="Node"]
script = ExtResource( 1 )
 GDSC            w      �����ׄ򶶶�   �����϶�   ������������������Ŷ   ���������������Ŷ���   ����׶��   ����¶��   ����������������Ҷ��   �������ض���   ϶��   ζ��   �������Ӷ���   ���¶���            ui_up               ui_down       ui_right      ui_left       Control/VBoxContainer/pos         pos:          Control/VBoxContainer/block       block:                                  
                           	      
         #      )      2      8      A      G      P      V      W      e      u      3YYY0�  PQV�  �  �  PQYYYY0�  P�  QV�  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�	  �  �  &�  T�  P�  QV�  �  T�	  �  �  �  �
  P�  QT�  �  �>  P�  Q�  �
  P�  QT�  �	  �>  P�  �
  QY`       [gd_scene load_steps=3 format=2]

[ext_resource path="res://Entities/ChunkHandler/ChunkHandler.tscn" type="PackedScene" id=1]
[ext_resource path="res://Entities/Player/Player.tscn" type="PackedScene" id=2]

[node name="Node2D" type="Node2D"]

[node name="ChunkHandler" parent="." instance=ExtResource( 1 )]
position = Vector2( 0, 0 )

[node name="Player" parent="." instance=ExtResource( 2 )]
position = Vector2( 157.338, -37.9644 )
z_index = 1
   [gd_scene load_steps=5 format=2]

[ext_resource path="res://Entities/Player/Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]
[ext_resource path="res://Entities/Block/Block.tscn" type="PackedScene" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 800, 6.488 )

[node name="TestWorld" type="Node2D"]

[node name="floor" type="StaticBody2D" parent="."]

[node name="Sprite" type="Sprite" parent="floor"]
scale = Vector2( 25, 0.2 )
texture = ExtResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="floor"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="left_wall" type="StaticBody2D" parent="."]
position = Vector2( -305.566, 685.234 )
rotation = -1.5708

[node name="Sprite" type="Sprite" parent="left_wall"]
scale = Vector2( 25, 0.2 )
texture = ExtResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="left_wall"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="right_wall" type="StaticBody2D" parent="."]
position = Vector2( 623.639, 237.19 )
rotation = -1.5708

[node name="Sprite" type="Sprite" parent="right_wall"]
scale = Vector2( 25, 0.2 )
texture = ExtResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="right_wall"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="ceiling" type="StaticBody2D" parent="."]
position = Vector2( -569.99, -281.294 )

[node name="Sprite" type="Sprite" parent="ceiling"]
scale = Vector2( 25, 0.2 )
texture = ExtResource( 2 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="ceiling"]
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="Block" parent="." instance=ExtResource( 3 )]
position = Vector2( -96, -40 )
has_mineral = true
mineral_type = 0

[node name="Block2" parent="." instance=ExtResource( 3 )]
position = Vector2( -96, -104 )
material_type = 1
has_mineral = true
mineral_type = 0

[node name="Block3" parent="." instance=ExtResource( 3 )]
position = Vector2( -160, -104 )
material_type = 2
has_mineral = true
mineral_type = 1

[node name="Block5" parent="." instance=ExtResource( 3 )]
position = Vector2( -216, -104 )
material_type = 2
has_mineral = true
mineral_type = 1

[node name="Block8" parent="." instance=ExtResource( 3 )]
position = Vector2( -176, -104 )
material_type = 1
has_mineral = true
mineral_type = 0

[node name="Block7" parent="." instance=ExtResource( 3 )]
position = Vector2( -240, -104 )
material_type = 2
has_mineral = true
mineral_type = 1

[node name="Block6" parent="." instance=ExtResource( 3 )]
position = Vector2( -296, -104 )
material_type = 2
has_mineral = true
mineral_type = 1

[node name="Block4" parent="." instance=ExtResource( 3 )]
position = Vector2( -160, -40 )
material_type = 3
has_mineral = true
mineral_type = 2

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 48, -51 )
        GDSC            �      ���ӄ�   ����Ӷ��   ���������������Ӷ���   ����   �����϶�   ������Ŷ   �����Ҷ�   ����������Ӷ   ����������Ŷ   �������Ӷ���   ������Ӷ   ��������Ӷ��   �嶶   �������������ն�   ����������Ҷ���   �������Ŷ���   ����׶��           �A  �������?             TextureRect          X       �?      @     @@     �@     �@     �@                                                 "   	   (   
   .      3      4      D      M      Y      e      q      }      �      �      �      �      �      �      �      �      �      3YYY;�  �  T�  PQYY0�  PQV�  �  T�)  �&  PQ�  �  T�  �  �  T�  �  �  �  T�  �  �  �  P�  Q�  �  �	  P�  QT�
  �  T�  P�  R�  Q�  �?  P�  T�  PQQ�  �?  P�  T�  P�  R�  QQ�  �?  P�  T�  P�  R�  QQ�  �?  P�  T�  P�	  R�  QQ�  �?  P�  T�  P�
  R�  QQ�  �?  P�  T�  P�  R�  QQ�  �?  P�  T�  P�  R�  QQ�  �?  P�  T�  PQQYYYY0�  P�  QV�  �  �?  P�  T�  P�  R�  QQY`         [gd_scene load_steps=4 format=2]

[ext_resource path="res://TestingScenes/NoiseTest.gd" type="Script" id=1]

[sub_resource type="OpenSimplexNoise" id=1]

[sub_resource type="NoiseTexture" id=2]
width = 1024
height = 600
noise = SubResource( 1 )

[node name="NoiseTest" type="Node2D"]
script = ExtResource( 1 )

[node name="TextureRect" type="Sprite" parent="."]
texture = SubResource( 2 )
           [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://Entities/Block/Block.gdc"
 [remap]

path="res://Entities/Block/BlockEnums.gdc"
            [remap]

path="res://Entities/ChunkHandler/Chunk.gdc"
          [remap]

path="res://Entities/ChunkHandler/ChunkHandler.gdc"
   [remap]

path="res://Entities/Player/Player.gdc"
               [remap]

path="res://Entities/Player/PlayerData.gdc"
           [remap]

path="res://Maps/CameraMover.gdc"
     [remap]

path="res://TestingScenes/NoiseTest.gdc"
              �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Depths     application/run/main_scene(         res://Maps/ChunkTestWorld.tscn     application/config/icon         res://icon.png     autoload/PlayerData0      &   *res://Entities/Player/PlayerData.tscn     autoload/BlockEnums,      #   *res://Entities/Block/BlockEnums.gd    debug/settings/stdout/print_fps            display/window/vsync/use_vsync             display/window/stretch/mode         2d     display/window/stretch/aspect         expand     input/ui_leftP              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script         input/ui_rightP              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script         input/ui_upP              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script         input/ui_downP              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      unicode           echo          script      '   memory/limits/message_queue/max_size_kb       (  7   rendering/quality/2d/use_nvidia_rect_flicker_workaround         #   rendering/quality/2d/use_pixel_snap         )   rendering/environment/default_environment          res://default_env.tres  