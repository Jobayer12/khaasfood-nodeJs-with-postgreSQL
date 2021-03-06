PGDMP         /            
    w         	   khaasfood    11.5    11.5     )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ,           1262    16394 	   khaasfood    DATABASE     �   CREATE DATABASE khaasfood WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE khaasfood;
             postgres    false            �            1259    16434    billinginformation    TABLE     �   CREATE TABLE public.billinginformation (
    billingname character varying(30),
    billaddress character varying(30),
    billcity character varying(30),
    billnumber character varying(15),
    billcode character varying(5),
    uuid uuid
);
 &   DROP TABLE public.billinginformation;
       public         postgres    false            �            1259    16476 
   categories    TABLE     �  CREATE TABLE public.categories (
    uid uuid DEFAULT uuid_in(("overlay"("overlay"(md5((((random())::text || ':'::text) || (clock_timestamp())::text)), '4'::text, 13), to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer), 17))::cstring) NOT NULL,
    name character varying(255),
    title character varying(255),
    image character varying(255)
);
    DROP TABLE public.categories;
       public         postgres    false            �            1259    16485    new_products    TABLE     �  CREATE TABLE public.new_products (
    uid uuid DEFAULT uuid_in(("overlay"("overlay"(md5((((random())::text || ':'::text) || (clock_timestamp())::text)), '4'::text, 13), to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer), 17))::cstring) NOT NULL,
    name character varying(30),
    price integer,
    weight character varying(30),
    image character varying(255)
);
     DROP TABLE public.new_products;
       public         postgres    false            �            1259    16491    popular    TABLE     �  CREATE TABLE public.popular (
    uid uuid DEFAULT uuid_in(("overlay"("overlay"(md5((((random())::text || ':'::text) || (clock_timestamp())::text)), '4'::text, 13), to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer), 17))::cstring) NOT NULL,
    name character varying(255),
    price integer,
    weight character varying(255),
    image character varying(255)
);
    DROP TABLE public.popular;
       public         postgres    false            �            1259    16500    product    TABLE     �  CREATE TABLE public.product (
    uid uuid DEFAULT uuid_in(("overlay"("overlay"(md5((((random())::text || ':'::text) || (clock_timestamp())::text)), '4'::text, 13), to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer), 17))::cstring) NOT NULL,
    category character varying(30),
    sub_category character varying(30),
    name character varying(30),
    weight character varying(30),
    price integer,
    image character varying
);
    DROP TABLE public.product;
       public         postgres    false            �            1259    16437    shippinginfo    TABLE     �   CREATE TABLE public.shippinginfo (
    shippingname character varying(30),
    shipnumber bigint,
    shipaddress character varying(30),
    shipzipcode integer,
    shipcity character varying(30),
    uuid uuid
);
     DROP TABLE public.shippinginfo;
       public         postgres    false            �            1259    16429    userinfo    TABLE     �   CREATE TABLE public.userinfo (
    email character varying(30),
    password character varying(255),
    verify boolean,
    firstname character varying(30),
    lastname character varying(30),
    uid uuid NOT NULL
);
    DROP TABLE public.userinfo;
       public         postgres    false            !          0    16434    billinginformation 
   TABLE DATA               l   COPY public.billinginformation (billingname, billaddress, billcity, billnumber, billcode, uuid) FROM stdin;
    public       postgres    false    197   �       #          0    16476 
   categories 
   TABLE DATA               =   COPY public.categories (uid, name, title, image) FROM stdin;
    public       postgres    false    199   �        $          0    16485    new_products 
   TABLE DATA               G   COPY public.new_products (uid, name, price, weight, image) FROM stdin;
    public       postgres    false    200   �!       %          0    16491    popular 
   TABLE DATA               B   COPY public.popular (uid, name, price, weight, image) FROM stdin;
    public       postgres    false    201   �#       &          0    16500    product 
   TABLE DATA               Z   COPY public.product (uid, category, sub_category, name, weight, price, image) FROM stdin;
    public       postgres    false    202   �&       "          0    16437    shippinginfo 
   TABLE DATA               j   COPY public.shippinginfo (shippingname, shipnumber, shipaddress, shipzipcode, shipcity, uuid) FROM stdin;
    public       postgres    false    198   �-                  0    16429    userinfo 
   TABLE DATA               U   COPY public.userinfo (email, password, verify, firstname, lastname, uid) FROM stdin;
    public       postgres    false    196   �.       �
           2606    16483    categories categories_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (uid);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    199            �
           2606    16489    new_products new_products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.new_products
    ADD CONSTRAINT new_products_pkey PRIMARY KEY (uid);
 H   ALTER TABLE ONLY public.new_products DROP CONSTRAINT new_products_pkey;
       public         postgres    false    200            �
           2606    16498    popular popular_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.popular
    ADD CONSTRAINT popular_pkey PRIMARY KEY (uid);
 >   ALTER TABLE ONLY public.popular DROP CONSTRAINT popular_pkey;
       public         postgres    false    201            �
           2606    16504    product product_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (uid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    202            �
           2606    16510    userinfo userinfo_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (uid);
 @   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT userinfo_pkey;
       public         postgres    false    196            �
           2606    16511    billinginformation uuid    FK CONSTRAINT     w   ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT uuid FOREIGN KEY (uuid) REFERENCES public.userinfo(uid);
 A   ALTER TABLE ONLY public.billinginformation DROP CONSTRAINT uuid;
       public       postgres    false    197    196    2716            �
           2606    16516    shippinginfo uuid    FK CONSTRAINT     q   ALTER TABLE ONLY public.shippinginfo
    ADD CONSTRAINT uuid FOREIGN KEY (uuid) REFERENCES public.userinfo(uid);
 ;   ALTER TABLE ONLY public.shippinginfo DROP CONSTRAINT uuid;
       public       postgres    false    198    196    2716            !   �   x���=N1��z|� #��ڞ���6�8�6���R�ӳR����b�6vv~o��^?��vO�e^������ao�n��l�P$�a���>��a�*Գ]j���� ��Rd�ɧ.�%H�֎�:6ʩY������#��0r�8FHY�w�g]�[�$ŭ.L J�z�>���p��L���siR(ks�G��7��T�      #   G  x�E�KN1��uz�^�(N��rD[Z	4���Ih0h
�ޞP^�H�|��P՘(��� �Ca_�Ci�_b�/px+���b论Ew5��,�7ݥ@c}@�������{��
C
)7�<*�hi��\����e:���?_�?Ls�Q��d�F���ɁW��ؠ�.�.��㘡��J|~߉U�/�~��������E�����&K� G'k[��P}���d
b7���X��˿2����,b)2a������gnX��M0��������~��l�[��ڞ ��2:�����\"0��e�h+�:}��b5�mn�H ������l�	�3y1      $   �  x�u��n1���S������^���ot�ڤ����[R���Z_~�<�2�(X��I�9�*	�k����<���a��<�YN���a��2�㭚��՞�����շ�q#�،9B!K@I*0��V�)�yTH�?�Z�4|��GQ1���`L+��a�A
���1�	$Q���������V;>���k�ݙ�q�E�(1����0�#���M��]��u�� �&�͝�=��O{��t\醹�L*(�QL���zck�N���ǻ�xGs!�^�lB �<EbO}�`PDck>����,�ix=χ�,�X��B^��.Jl9" ?��)qO�1k�xu�}
�qT�uh��o��sv�8�8y��9G��N�Ф��Ħn��K��ԣ���INJc�;�p^3z�Yt%u����f�W�T�F*��~�d��!��*C�*<�6���~?��l�K��*��l6 �e�^      %   �  x�}�ˎ�6E���rf�	���!�0@@I��i?.{��ׇ��"��/�P�<�kO���|� �'0+;,Z7��i�P�+=�>��s�<g�����c�??Ƿ�Xs��e+8�!���G�P��Y�ܾ�}�k�:�Αv����.�˱�//
PJ�`+z�L�z��5>�޹�Ty���m
����*��a�^ú��ǐ {��.D�) ��j�:��t��$�1>㹋�z�6E�g\"k �\���1zu;�F{�uX�8w���m�*���������hK��zf�Z��P'��B�^�y;�G:[��1\�_�a��0DL��5g���`u��3RYm�H�TG�/Q��7�ϨO�7�
5�,v83d�J@�[/�Q3��NÍ��6^�WG}H�D��"	��"�GH�Hb�k������a�fe�/�6��j,�e�@tv��I4�]�)m�"~�<����71��ux�5�����ekRH�K"�K*��eZ���qZ���m=����*��/x0N
GjG�57'J�ҿ��PLUE��x�)J��%�\��[d���`Ho��v5�����yOX�w��qu#�k�\����lb�ad��R�o�kӲ6��o��]�� ���Uꐙ4�� s��>��oeyƿ�?*�u��6�vi�F�7r���-e6dո3���t!��?z������?n��      &   [  x����r�HE׬��{�=�~���|AGt 3�2�z8()<5_?�JٖlY%E���!� Wddfa�Uas�"IE&UsUJ%熧ݖ�g�L��:������\m���2���5�?���1�|Y����B\��:/b�E8c�d*���qr��xb;D�$;�QIaC0"z�E�o��Z�����4�'ڎ[:gZ_����r'T�>���M��(ٔ^�Y��4�>��3ߠ�	��$R��j��!uPBVv>�i��)*��)��)�Y
�����	���}���ռ+<�ʮ<O��P��i;��^+�gJ����Z`Z^��s*YP�JXoYD뵐.�/Z'��W�Ӵ��`={H�]Z�om��QR��J���[�!�RB��|��扶@]���{�H6J�:�י \ڪ��4��de�n�Gk�V8�A=����҉�ө�ȥ�tA+DEƉ�B�9(��B���u;���A�.��~bֶ�9
�2*��*�#�uab o[~�L�y���ҁ�cy:�*�}V����ę~d��VJ���.�$cIQ��B	�b��78��R!���������
�&�ϤY�&�읶ι�w�T�q:|@{������δ�M�Be���� X����L��@��y��OYU�~V{�3{�Yj�]D�'�Et�
�;'�y���O�������	�J�l��s���\/�Z'��ʹ~����p@�]PN��Z�3BP�,�RIP.ۢ�) �h kl����h��z,3�f\p�f���3u�_3YU��*�l��Ҍa�<�Ik����gb:[�Ȋ��3*4G�«��$�(�w�	��t܌yM�y\��0#۽�4_��,9�e�82�
��C���LE��L:�����k���v�Sy�T�����Z�K�rT.n��:���
䈗�lCߠ�qu�P��刹T�y*|�/�
�� �dOI�l/���'UM^���A^��q�9�i�f2���9T�L����pf�E��J>�����}�á�8��}�`�X�7��� E��|��2M��XS�y�Lޘ��O�p3�g�\� �9D/j:/gF�^�jfޞ
�lDn>�m*�=JA.�
��8( �X��οD��Oo%�^z�ݚF\OW�8��\��NXel6��,E��BTK@	����C�EpP�o���z7���K�v��]}���4�"K��uQ��)�6c�bf~���uh`�7��<S���r)H��`L��$����;���D\��J�&���	*���	�M��$�uk��hP��x�ۊ78�/�{6������V������3Do�Į0 ,�*4i���ee܃���{� e�ļ15����֡'�_l<�|l�2oz�a�m$^9j_����th�,q�Ѫ��������w�-U��{D��Q$��U�N�3%��,����_�K�s�0�`Ճ�:�E��
IЅ��Ӕ�����[̹*�F�1x�o-F�B!"�(16)��
s(m����f�Ĵ><-<�ǹ�Ϯ������x�>���7o/�;�����h�1�M/۷a�*Q�bhg��/�㎏���L�XC5n{I �`.(�Xd��*�!��o�7�[�wa�;�l��a�-�Z���Xh�4�f��[����d��ї��[uAn>��0۱:cht-RVL��D�J�b�����:y�7��U���a��V���K�>��~��'���aab�^��;��??��W^�7�06M/�l��x�<�9�4��GW�O��������4��uTpߣ��t��e�l��nXlX��<��p-Q}D���c�2�;��,0�n��/G�gboU�ǀɆ��Z�~;�Sa99cމO�4�:��2�z|��jP�|�����_?~��?e���      "   s   x�M�=�0@��>E/���;k�8��R+n�D�����;���GT �,,�p}-���i�Ł�h��t��~����T3ԯTc1��Է2$����E��I	-<Z�t@�]"%8            x�u��r�J�yozTw�.$h�	1ɮlzBK��>ة��rR������;�N��o�U��kvۛ[�o������[��sr��I�<�mo^��NN�n]%�^�����c<�A���o~Lޟ�$���� ���h�ʉe��N��F_��ȼ��{u8	�0^��b�l.�~��D���._���~��6��84LR�9��f�2	�B+���2�Q�Q��ٯrXf�s��bj�����a��0�ﳬ,�e3����l��z�e��\e$fs���d���e`�	��C�)��^�Xі"���>�u���dz �Rt�Vw����}5ߛ��l��4�>#;�E�����H9�|f���H�����[���)*�W�4��p��C����Y�ͥn��\T��Ip��0�� N�T2�C�-���D�?��7����j�OȎ򂈻�|ts�$W�6o���)M���}ܴو�F�󣥂
qdP���Ԁ�������,���z*�AJ��9�j8n��m������)�[�ɹ���0A���{��[z�adPC؃�H�8!aJ~��/�����*{�����!��f�#ɨ�X��l��L<�LϭݕƘ{�R4�9U�B�r� �s��NA�i�8XMg��D�ɶ�}�4�Σx�N$~�`��3,R�-W��ӡ9��W�`j)��{f�>os9r-$H���.5S4��,��Y��F�׮�+�'�����P�� ����%[��luu��DJ�/�8+�.���D;�������t~#j~     