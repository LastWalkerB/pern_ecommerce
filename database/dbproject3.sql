PGDMP     0    6             
    x         
   dbproject3    13.1    13.0 >               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16742 
   dbproject3    DATABASE     i   CREATE DATABASE dbproject3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Pakistan.1252';
    DROP DATABASE dbproject3;
                postgres    false            |           1247    16744    role    TYPE     N   CREATE TYPE public.role AS ENUM (
    'buyer',
    'merchant',
    'admin'
);
    DROP TYPE public.role;
       public          postgres    false            �            1259    16923    carts    TABLE     Q   CREATE TABLE public.carts (
    cart_id integer NOT NULL,
    user_id integer
);
    DROP TABLE public.carts;
       public         heap    postgres    false            �            1259    16921    carts_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carts_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.carts_cart_id_seq;
       public          postgres    false    207                       0    0    carts_cart_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.carts_cart_id_seq OWNED BY public.carts.cart_id;
          public          postgres    false    206            �            1259    16898 
   categories    TABLE     �   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(30) DEFAULT ''::character varying
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16896    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public          postgres    false    203                       0    0    categories_category_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;
          public          postgres    false    202            �            1259    16968 	   lineitems    TABLE     �   CREATE TABLE public.lineitems (
    lineitem_id integer NOT NULL,
    cart_id integer,
    order_id integer,
    product_id integer
);
    DROP TABLE public.lineitems;
       public         heap    postgres    false            �            1259    16966    lineitems_lineitem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lineitems_lineitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.lineitems_lineitem_id_seq;
       public          postgres    false    213                       0    0    lineitems_lineitem_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.lineitems_lineitem_id_seq OWNED BY public.lineitems.lineitem_id;
          public          postgres    false    212            �            1259    16936    orders    TABLE     s   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    created_date date NOT NULL,
    user_id integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16934    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    209            	           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    208            �            1259    16949    payments    TABLE     �   CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    total numeric(10,2) DEFAULT 0.0,
    user_id integer,
    order_id integer
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    16947    payments_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.payments_payment_id_seq;
       public          postgres    false    211            
           0    0    payments_payment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;
          public          postgres    false    210            �            1259    16907    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(80) DEFAULT ''::character varying,
    price numeric(10,2) DEFAULT 0.00,
    stockqty integer DEFAULT 0,
    category_id integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16905    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    205                       0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    204            �            1259    16885    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    password character varying(200) NOT NULL,
    first_name character varying(15) DEFAULT ''::character varying,
    last_name character varying(15) DEFAULT ''::character varying,
    email character varying(30) DEFAULT ''::character varying,
    address character varying(200) DEFAULT ''::character varying,
    user_role public.role DEFAULT 'buyer'::public.role
);
    DROP TABLE public.users;
       public         heap    postgres    false    636    636            �            1259    16883    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    201                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    200            U           2604    16926    carts cart_id    DEFAULT     n   ALTER TABLE ONLY public.carts ALTER COLUMN cart_id SET DEFAULT nextval('public.carts_cart_id_seq'::regclass);
 <   ALTER TABLE public.carts ALTER COLUMN cart_id DROP DEFAULT;
       public          postgres    false    206    207    207            O           2604    16901    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    203    202    203            Y           2604    16971    lineitems lineitem_id    DEFAULT     ~   ALTER TABLE ONLY public.lineitems ALTER COLUMN lineitem_id SET DEFAULT nextval('public.lineitems_lineitem_id_seq'::regclass);
 D   ALTER TABLE public.lineitems ALTER COLUMN lineitem_id DROP DEFAULT;
       public          postgres    false    212    213    213            V           2604    16939    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    209    208    209            W           2604    16952    payments payment_id    DEFAULT     z   ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);
 B   ALTER TABLE public.payments ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    210    211    211            Q           2604    16910    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    205    204    205            I           2604    16888    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    201    200    201            �          0    16923    carts 
   TABLE DATA           1   COPY public.carts (cart_id, user_id) FROM stdin;
    public          postgres    false    207   UG       �          0    16898 
   categories 
   TABLE DATA           @   COPY public.categories (category_id, category_name) FROM stdin;
    public          postgres    false    203   �G       �          0    16968 	   lineitems 
   TABLE DATA           O   COPY public.lineitems (lineitem_id, cart_id, order_id, product_id) FROM stdin;
    public          postgres    false    213   �G       �          0    16936    orders 
   TABLE DATA           A   COPY public.orders (order_id, created_date, user_id) FROM stdin;
    public          postgres    false    209   H       �          0    16949    payments 
   TABLE DATA           H   COPY public.payments (payment_id, total, user_id, order_id) FROM stdin;
    public          postgres    false    211   GH       �          0    16907    products 
   TABLE DATA           Z   COPY public.products (product_id, product_name, price, stockqty, category_id) FROM stdin;
    public          postgres    false    205   �H       �          0    16885    users 
   TABLE DATA           d   COPY public.users (user_id, password, first_name, last_name, email, address, user_role) FROM stdin;
    public          postgres    false    201    I                  0    0    carts_cart_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.carts_cart_id_seq', 1, true);
          public          postgres    false    206                       0    0    categories_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq', 81, true);
          public          postgres    false    202                       0    0    lineitems_lineitem_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.lineitems_lineitem_id_seq', 24, true);
          public          postgres    false    212                       0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 8, true);
          public          postgres    false    208                       0    0    payments_payment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.payments_payment_id_seq', 24, true);
          public          postgres    false    210                       0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 17, true);
          public          postgres    false    204                       0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);
          public          postgres    false    200            a           2606    16928    carts carts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (cart_id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public            postgres    false    207            ]           2606    16904    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    203            g           2606    16973    lineitems lineitems_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.lineitems
    ADD CONSTRAINT lineitems_pkey PRIMARY KEY (lineitem_id);
 B   ALTER TABLE ONLY public.lineitems DROP CONSTRAINT lineitems_pkey;
       public            postgres    false    213            c           2606    16941    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    209            e           2606    16955    payments payments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    211            _           2606    16915    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    205            [           2606    16895    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            i           2606    16929    carts carts_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 B   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_user_id_fkey;
       public          postgres    false    207    2907    201            m           2606    16974     lineitems lineitems_cart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineitems
    ADD CONSTRAINT lineitems_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.carts(cart_id);
 J   ALTER TABLE ONLY public.lineitems DROP CONSTRAINT lineitems_cart_id_fkey;
       public          postgres    false    213    2913    207            n           2606    16979 !   lineitems lineitems_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineitems
    ADD CONSTRAINT lineitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 K   ALTER TABLE ONLY public.lineitems DROP CONSTRAINT lineitems_order_id_fkey;
       public          postgres    false    209    213    2915            o           2606    16984 #   lineitems lineitems_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lineitems
    ADD CONSTRAINT lineitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 M   ALTER TABLE ONLY public.lineitems DROP CONSTRAINT lineitems_product_id_fkey;
       public          postgres    false    213    205    2911            j           2606    16942    orders orders_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_fkey;
       public          postgres    false    2907    201    209            l           2606    16961    payments payments_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_order_id_fkey;
       public          postgres    false    2915    209    211            k           2606    16956    payments payments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_user_id_fkey;
       public          postgres    false    2907    201    211            h           2606    16916 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public          postgres    false    203    205    2909            �      x�3�4�2�4�2�4�2�4����� ��      �   7   x�3�L,*)�2�LM)MN,����2�L�+I-*I�����L8K�S2�r1z\\\ ���      �   .   x�Ʊ  ��=w1��]�P%�&e�$%OL��b��!�q�N      �   0   x�3�4202�54�54�4�2Cp�9���\Nc.הӄ+F��� \�
O      �   5   x�ɹ  ������s�:Y��E@(�W�d:����t�꫰���	      �   d   x�M�A
� ���Ä��u�6%Ba�d�'�����c�QS�þ�@���W@�}beRb���Y��O��(��Q�C�)^a?Jm%k��c-�﫶�t"� �+$      �   �  x�m�[s�0F����3�p�����(���K�H	�)��[�sfl&ߞ=����	I2�PB ���/�1��q�:&uL�L�L�L��1~y�9�;�tL�L�L�L�
^P��q��O?bM�������ֱ���&�)+�荗ػ�S���>���&�����IIs!,��Zo/��嵌�M���v��+���o��'�h[�Liv����?;��/v��o�y�l5u���6(Ms\�u��Y-��(�_�ڹ��}x�&{O~Ha�a��z�1:�)�V��������ݹu6Pn�-���RڷD�'1�'�\XL����2y��,{�C ~ 	B�]��sov?	�=�7T�����.Xu�4����.�L�VJš���/$��*͵�Ġ��4�5�e	ԫq�*���4��7���l�N��-�5=܍�m'JJ�!,�e�ĀD,-@������O�	���/����     