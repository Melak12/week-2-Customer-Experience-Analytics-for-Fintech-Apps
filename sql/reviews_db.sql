--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    info jsonb
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banks_id_seq OWNER TO postgres;

--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    bank_id integer,
    review text,
    date timestamp without time zone,
    source character varying(100),
    processed_review text,
    bert_sentiment character varying(20),
    bert_score double precision,
    vader_score double precision,
    vader_sentiment character varying(20),
    textblob_score double precision,
    textblob_sentiment character varying(20)
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (id, name, info) FROM stdin;
1	BOA	\N
2	CBE	\N
3	DASHEN	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, bank_id, review, date, source, processed_review, bert_sentiment, bert_score, vader_score, vader_sentiment, textblob_score, textblob_sentiment) FROM stdin;
2143	2	Good ,easy to use	2025-05-16 00:00:00	Google Play Store	good easy use	positive	0.9997110962867737	0.7003	positive	0.5666666666666667	positive
2144	2	Good app	2025-05-15 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2145	2	Good job👍	2025-05-14 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2146	2	good	2025-05-14 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2147	2	nice	2025-05-14 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2148	2	Please kindly ask to update the app and allow us to screenshot, it's convenient and efficient as long as you add security to the access there is no reason to block us from screenshooting our screen.	2025-05-14 00:00:00	Google Play Store	please kindly ask update app allow u screenshot convenient efficient long add security access reason block u screenshooting screen	negative	0.9865299463272095	0.8271	positive	0.27499999999999997	positive
2149	2	I have using the CBE mobile banking app. and overall i appreciate its Feuteres However i.ve Notticed that when i turn on the Developer options on my divice the App.Stop Functioning prorerly It.Would Be Great If You could look into This issue as l often need to access Developer setting for Otter Application ThankYou For Your attention to This Matter	2025-05-13 00:00:00	Google Play Store	using cbe mobile banking app overall appreciate feuteres however notticed turn developer option divice functioning prorerly great could look issue l often need access developer setting otter application thankyou attention matter	negative	0.5854965448379517	0.7845	positive	0.4	positive
2150	2	customer service is bad nothing is good about this bank	2025-05-13 00:00:00	Google Play Store	customer service bad nothing good bank	negative	0.9995587468147278	-0.7101	negative	5.551115123125783e-17	neutral
2151	2	It is Amazing Mobile Banking App....But why the screenshot of the receipt doesnt work	2025-05-13 00:00:00	Google Play Store	amazing mobile banking app screenshot receipt doesnt work	negative	0.9937962293624878	0.5859	positive	0.6000000000000001	positive
2152	2	fast and simple easy to use 👌	2025-05-12 00:00:00	Google Play Store	fast simple easy use	positive	0.9955869913101196	0.4404	positive	0.2111111111111111	positive
2153	2	The fastest transferring app I ever had its so reliable	2025-05-11 00:00:00	Google Play Store	fastest transferring app ever reliable	positive	0.9966121315956116	0	neutral	0	neutral
2154	2	Funds transferred from the same bank do not reflect in the account, even though a confirmation text message was received.	2025-05-11 00:00:00	Google Play Store	fund transferred bank reflect account even though confirmation text message received	negative	0.9822893738746643	0	neutral	0	neutral
2155	2	it's easy and fast	2025-05-10 00:00:00	Google Play Store	easy fast	positive	0.997892439365387	0.4404	positive	0.31666666666666665	positive
2156	2	This app don't have self activation only you have to look near cbe branch that's disgusting	2025-05-10 00:00:00	Google Play Store	app self activation look near cbe branch disgusting	negative	0.9990290403366089	-0.5267	negative	-0.45	negative
2157	2	hello dearest CBE office personnel make some benefits for those using interest free accounts thanks for your help	2025-05-09 00:00:00	Google Play Store	hello dearest cbe office personnel make benefit using interest free account thanks help	positive	0.9981657862663269	0.9552	positive	0.30000000000000004	positive
2158	2	wow best application ever	2025-05-09 00:00:00	Google Play Store	wow best application ever	positive	0.9997984766960144	0.8402	positive	0.55	positive
2159	2	good	2025-05-09 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2160	2	Am sorry but what does developer mode do to the application ? hack it ? are you sure you are developer or are you stupid, doesnt makes sense,	2025-05-08 00:00:00	Google Play Store	sorry developer mode application hack sure developer stupid doesnt make sense	negative	0.9998055100440979	-0.34	negative	-0.26666666666666666	negative
2161	2	Best	2025-05-08 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2162	2	the pride of Ethiopian bank 🏦	2025-05-08 00:00:00	Google Play Store	pride ethiopian bank	positive	0.9983717799186707	0.34	positive	0	neutral
2163	2	why the app telling me to turn of developer options please fix it.	2025-05-07 00:00:00	Google Play Store	app telling turn developer option please fix	negative	0.9477195739746094	0.3182	positive	0	neutral
2164	2	good	2025-05-07 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2165	2	ok	2025-05-07 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2166	2	i am very happy . i have small prob. after i transfer i cant put the transfer cashe bil to my dic.	2025-05-07 00:00:00	Google Play Store	happy small prob transfer cant put transfer cashe bil dic	positive	0.9675687551498413	0.5719	positive	0.275	positive
2167	2	ok	2025-05-07 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2168	2	good	2025-05-06 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2169	2	amazing apps	2025-05-06 00:00:00	Google Play Store	amazing apps	positive	0.9998716115951538	0.5859	positive	0.6000000000000001	positive
2170	2	All service of Mobile Banking	2025-05-06 00:00:00	Google Play Store	service mobile banking	positive	0.7986071705818176	0	neutral	0	neutral
2171	2	needs improvement	2025-05-06 00:00:00	Google Play Store	need improvement	negative	0.983095109462738	0.4588	positive	0	neutral
2172	2	i miss the old one i couldn't send my mony to other bank..	2025-05-06 00:00:00	Google Play Store	miss old one could send mony bank	negative	0.9977204203605652	-0.1531	negative	0.1	positive
2173	2	the app is recently crushing each time you open and try to make transfers...it used to be good. take lessons from the Dashen Super app or ethiotelecom. it is not befitting of your experience and glory. inv3st in making it more friendly and convenient. I am considering leaving CBE for good.	2025-05-06 00:00:00	Google Play Store	app recently crushing time open try make transfer used good take lesson dashen super app ethiotelecom befitting experience glory inv3st making friendly convenient considering leaving cbe good	negative	0.8116813898086548	0.9313	positive	0.41805555555555557	positive
2174	2	good	2025-05-06 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2175	2	good but these week not oky	2025-05-06 00:00:00	Google Play Store	good week oky	positive	0.9998664855957031	0.4404	positive	0.7	positive
2219	2	I need support you	2025-04-27 00:00:00	Google Play Store	need support	negative	0.9610945582389832	0.4019	positive	0	neutral
3201	3	this app is good for you guys	2025-06-09 00:00:00	Google Play Store	app good guy	positive	0.9998078942298889	0.4404	positive	0.7	positive
3202	3	wow	2025-06-09 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3203	3	kalid	2025-06-08 00:00:00	Google Play Store	kalid	positive	0.8998875617980957	0	neutral	0	neutral
3204	3	I like this mobile banking app very much. Overall user interface and navigation is awesome. But it lacks instant response when someone deposit or withdraw money.	2025-06-07 00:00:00	Google Play Store	like mobile banking app much overall user interface navigation awesome lack instant response someone deposit withdraw money	negative	0.9986687898635864	0.6486	positive	0.3333333333333333	positive
3205	3	love	2025-06-06 00:00:00	Google Play Store	love	positive	0.9998735189437866	0.6369	positive	0.5	positive
3206	3	መቸሸጠ	2025-06-03 00:00:00	Google Play Store	መቸሸጠ	negative	0.6970565915107727	0	neutral	0	neutral
3207	3	wow	2025-06-03 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3208	3	gadaa	2025-06-01 00:00:00	Google Play Store	gadaa	negative	0.7211463451385498	0	neutral	0	neutral
3209	3	Massive upgrade from the Amole app.	2025-05-31 00:00:00	Google Play Store	massive upgrade amole app	positive	0.7140390872955322	0	neutral	0	neutral
3210	3	good	2025-05-31 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3211	3	very good for this app	2025-05-31 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
3212	3	top	2025-05-31 00:00:00	Google Play Store	top	positive	0.9997069239616394	0.2023	positive	0.5	positive
3213	3	this app better than Amole . but the biometric on new update doesn't work	2025-05-31 00:00:00	Google Play Store	app better amole biometric new update work	negative	0.9019683599472046	0.4404	positive	0.3181818181818182	positive
3214	3	Wow	2025-05-30 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3215	3	good	2025-05-30 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3216	3	wow to it saff and this app	2025-05-30 00:00:00	Google Play Store	wow saff app	positive	0.9958081245422363	0.5859	positive	0.1	positive
3217	3	it too slow	2025-05-29 00:00:00	Google Play Store	slow	negative	0.9997313618659973	0	neutral	-0.30000000000000004	negative
3218	3	ዳሽን ባንክ ይለያል	2025-05-28 00:00:00	Google Play Store	ዳሽን ባንክ ይለያል	negative	0.8337252736091614	0	neutral	0	neutral
3219	3	real life changer	2025-05-28 00:00:00	Google Play Store	real life changer	positive	0.9997788071632385	0	neutral	0.2	positive
3220	3	👍👍👍	2025-05-28 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
3221	3	good	2025-05-28 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3222	3	nice application	2025-05-27 00:00:00	Google Play Store	nice application	positive	0.9998229146003723	0.4215	positive	0.6	positive
3223	3	good	2025-05-27 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3224	3	wow	2025-05-27 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3225	3	useless app ever loading take long	2025-05-27 00:00:00	Google Play Store	useless app ever loading take long	negative	0.9997350573539734	-0.4215	negative	-0.275	negative
3226	3	Game changer app! Dashen Bank Super App is fast, secure, and easy to use. The three-click payment makes sending money super quick, and the QR code payment is perfect for cashless shopping. I also love the biometric login and easy airtime and bill payments. Everything I need is in one place. Dashen Bank has really raised the bar for digital banking in Ethiopia. Highly recommended!	2025-05-26 00:00:00	Google Play Store	game changer app dashen bank super app fast secure easy use payment make sending money super quick qr code payment perfect cashless shopping also love biometric login easy airtime bill payment everything need one place dashen bank really raised bar digital banking ethiopia highly recommended	positive	0.9925314784049988	0.9776	positive	0.30205128205128207	positive
3227	3	very useful App	2025-05-26 00:00:00	Google Play Store	useful app	positive	0.9991915822029114	0.4404	positive	0.3	positive
3228	3	Simple, robust features? Yes, please! But the endless loading screen killed the fun—I couldn’t use it for days. Fix the glitch, and I’ll yeet a higher rating!	2025-05-26 00:00:00	Google Play Store	simple robust feature yes please endless loading screen killed use day fix glitch yeet higher rating	positive	0.7622604370117188	0.2263	positive	-0.018750000000000003	neutral
3229	3	Wawww	2025-05-24 00:00:00	Google Play Store	wawww	negative	0.9418038129806519	0	neutral	0	neutral
3230	3	it is good but some times says duplicate transaction why?	2025-05-24 00:00:00	Google Play Store	good time say duplicate transaction	positive	0.7822734713554382	0.4404	positive	0.7	positive
3231	3	very Nice	2025-05-23 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3232	3	its best	2025-05-23 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3233	3	it is not as good as to the other mobile bank app.	2025-05-22 00:00:00	Google Play Store	good mobile bank app	positive	0.9997158646583557	0.4404	positive	0.7	positive
3234	3	The best of best is now arrived **Empowering Your Financial Freedom** "Experience seamless banking at your fingertips with Dashen Bank. Empowering your financial freedom, anytime, anywhere!" **Innovation Meets Convenience** "Dashen Bank Mobile Banking: Where innovation meets convenience. **Secure and Reliable** "Bank with confidence	2025-05-22 00:00:00	Google Play Store	best best arrived empowering financial freedom experience seamless banking fingertip dashen bank empowering financial freedom anytime anywhere innovation meet convenience dashen bank mobile banking innovation meet convenience secure reliable bank confidence	positive	0.994884192943573	0.9812	positive	0.4166666666666667	positive
3235	3	wow	2025-05-20 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3236	3	Nothing is changed in the updated version. You have been collecting comments but where is the feed back you improved in this version. superapp is mot functioning today.	2025-05-20 00:00:00	Google Play Store	nothing changed updated version collecting comment feed back improved version superapp mot functioning today	negative	0.9801502227783203	0.4767	positive	0	neutral
3237	3	good	2025-05-20 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3238	3	its best	2025-05-19 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2220	2	the worst Mobile banking i have ever seen in my life	2025-04-26 00:00:00	Google Play Store	worst mobile banking ever seen life	negative	0.9997971653938293	-0.6249	negative	-1	negative
2176	2	well designed! Fixing bugs & two step verification with biometric... simply it's great!	2025-05-06 00:00:00	Google Play Store	well designed fixing bug two step verification biometric simply great	positive	0.9962579011917114	0.7351	positive	0.8	positive
2177	2	Good app	2025-05-06 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2178	2	If any developer is reading this please fix the screenshot functionality or at least the download button should work flawlessly without me touching it twenty times.	2025-05-05 00:00:00	Google Play Store	developer reading please fix screenshot functionality least download button work flawlessly without touching twenty time	negative	0.9819852709770203	0.4767	positive	0.39999999999999997	positive
2179	2	it's a great job.but one more thing, it hasn't been placed for transfer to other banks on face like mobile charge card place	2025-05-05 00:00:00	Google Play Store	great one thing placed transfer bank face like mobile charge card place	negative	0.9724521040916443	0.765	positive	0.8	positive
2180	2	CBE mobilr bankg	2025-05-05 00:00:00	Google Play Store	cbe mobilr bankg	positive	0.8703056573867798	0	neutral	0	neutral
2181	2	wow	2025-05-05 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
2182	2	verygood	2025-05-05 00:00:00	Google Play Store	verygood	positive	0.9988996982574463	0	neutral	0	neutral
2183	2	ممتاز جدا	2025-05-04 00:00:00	Google Play Store	ممتاز جدا	negative	0.8031745553016663	0	neutral	0	neutral
2184	2	it's very low quality application	2025-05-04 00:00:00	Google Play Store	low quality application	negative	0.9989878535270691	-0.2732	negative	0	neutral
2185	2	Very Amazing Apps	2025-05-04 00:00:00	Google Play Store	amazing apps	positive	0.9998716115951538	0.5859	positive	0.6000000000000001	positive
2186	2	አዛ	2025-05-04 00:00:00	Google Play Store	አዛ	negative	0.6970565915107727	0	neutral	0	neutral
2187	2	wow simple life	2025-05-04 00:00:00	Google Play Store	wow simple life	positive	0.9997076392173767	0.5859	positive	0.05	neutral
2188	2	it's nice	2025-05-03 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2189	2	Why stacked sometimes	2025-05-03 00:00:00	Google Play Store	stacked sometimes	negative	0.9902841448783875	0	neutral	0	neutral
2190	2	good app	2025-05-03 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2191	2	nice	2025-05-03 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2192	2	okay 👍 but sometimes busy	2025-05-03 00:00:00	Google Play Store	okay sometimes busy	positive	0.995305597782135	0.2263	positive	0.3	positive
2193	2	the worst commercial company that fails to do even the most normal things again and and again.	2025-05-03 00:00:00	Google Play Store	worst commercial company fails even normal thing	negative	0.9997966885566711	-0.7845	negative	-0.3375	negative
2194	2	nice	2025-05-03 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2195	2	Very good app. but disappointed by general cessation of system.	2025-05-02 00:00:00	Google Play Store	good app disappointed general cessation system	negative	0.9282512068748474	-0.0516	negative	-9.25185853854297e-18	neutral
2196	2	excellent	2025-05-02 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2197	2	good	2025-05-02 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2198	2	good	2025-05-02 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2199	2	Good and fast	2025-05-02 00:00:00	Google Play Store	good fast	positive	0.9998499155044556	0.4404	positive	0.44999999999999996	positive
2200	2	Unreliable!	2025-05-02 00:00:00	Google Play Store	unreliable	negative	0.9997265934944153	0	neutral	0	neutral
2201	2	Best the best fast	2025-05-02 00:00:00	Google Play Store	best best fast	positive	0.9998225569725037	0.8555	positive	0.7333333333333334	positive
2202	2	good app	2025-05-02 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2203	2	happy	2025-05-02 00:00:00	Google Play Store	happy	positive	0.9998753070831299	0.5719	positive	0.8	positive
2204	2	fast and reliable	2025-05-02 00:00:00	Google Play Store	fast reliable	positive	0.9998382329940796	0	neutral	0.2	positive
2205	2	network errorrrrrr	2025-05-02 00:00:00	Google Play Store	network errorrrrrr	negative	0.9978076815605164	0	neutral	0	neutral
2206	2	Best app but there is some problem I can't send money to telebirr or mpesa so if you can add that it could be use full	2025-05-02 00:00:00	Google Play Store	best app problem ca send money telebirr mpesa add could use full	negative	0.9925958514213562	0.3612	positive	0.675	positive
2207	2	its good and simple to use	2025-05-02 00:00:00	Google Play Store	good simple use	positive	0.9997674822807312	0.4404	positive	0.35	positive
2208	2	worest app like that bank for security and network access	2025-05-02 00:00:00	Google Play Store	worest app like bank security network access	negative	0.9937354922294617	0.5994	positive	0	neutral
2209	2	it's the best app i	2025-05-02 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2210	2	not bad not good	2025-05-02 00:00:00	Google Play Store	bad good	positive	0.9997218251228333	-0.1531	negative	5.551115123125783e-17	neutral
2211	2	its very nice	2025-05-02 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2212	2	do not work this week	2025-04-30 00:00:00	Google Play Store	work week	positive	0.9412037134170532	0	neutral	0	neutral
2213	2	It crashes frequently	2025-04-30 00:00:00	Google Play Store	crash frequently	negative	0.9985750913619995	-0.4019	negative	0.1	positive
2214	2	the best	2025-04-28 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2215	2	I can simply describe this app as "Making all your work easier".	2025-04-28 00:00:00	Google Play Store	simply describe app making work easier	positive	0.9366989135742188	0.4215	positive	0	neutral
2216	2	goid	2025-04-28 00:00:00	Google Play Store	goid	negative	0.7086994647979736	0	neutral	0	neutral
2001	2	v.good app	2025-06-09 00:00:00	Google Play Store	app	positive	0.9684572219848633	0	neutral	0	neutral
2002	2	very good app	2025-06-09 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2003	2	Very amazing app indeed. I'm enjoying it	2025-06-08 00:00:00	Google Play Store	amazing app indeed enjoying	positive	0.9998632669448853	0.802	positive	0.55	positive
2004	2	Best	2025-06-08 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2005	2	20 years	2025-06-08 00:00:00	Google Play Store	20 year	positive	0.9958376884460449	0	neutral	0	neutral
2006	2	A great app. It's like carrying a bank in your pocket.	2025-06-07 00:00:00	Google Play Store	great app like carrying bank pocket	positive	0.9976674914360046	0.765	positive	0.8	positive
2007	2	More than garrantty bank EBC.	2025-06-07 00:00:00	Google Play Store	garrantty bank ebc	negative	0.9680941104888916	0	neutral	0	neutral
2008	2	really am happy to this app it is Siple to use everything	2025-06-07 00:00:00	Google Play Store	really happy app siple use everything	positive	0.9997885823249817	0.6115	positive	0.8	positive
2009	2	I liked this app. But the User interface is very basic and not attractive at all.	2025-06-07 00:00:00	Google Play Store	liked app user interface basic attractive	positive	0.9996671676635742	0.6908	positive	0.4666666666666666	positive
2010	2	"Why don’t your ATMs support account-to-account transfers like other countries( Kenya, Nigeria , South africa)"	2025-06-06 00:00:00	Google Play Store	atm support transfer like country kenya nigeria south africa	negative	0.8313249349594116	0.6369	positive	0	neutral
2011	2	what is this app problem???	2025-06-05 00:00:00	Google Play Store	app problem	negative	0.9991914629936218	-0.4019	negative	0	neutral
2012	2	the app is proactive and a good connections.	2025-06-05 00:00:00	Google Play Store	app proactive good connection	positive	0.9998316764831543	0.6908	positive	0.7	positive
2013	2	I cannot send to cbebirr app. through this app.	2025-06-05 00:00:00	Google Play Store	send cbebirr app app	negative	0.9793662428855896	0	neutral	0	neutral
2014	2	good	2025-06-05 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2015	2	not functional	2025-06-05 00:00:00	Google Play Store	functional	positive	0.9993332028388977	0	neutral	0	neutral
2016	2	everytime you uninstall the app you have to reach them out physically. very oldy! if that's one of security layer, they'd check for fraud attempt via app source directly(source:- app store, play store ... etc) implicitly ! we are in 2025, physical presence for every app install is traditional(traditionally very rare).	2025-06-04 00:00:00	Google Play Store	everytime uninstall app reach physically oldy one security layer check fraud attempt via app source directly source app store play store etc implicitly 2025 physical presence every app install traditional traditionally rare	negative	0.9954937696456909	0.0258	neutral	0.08	positive
2017	2	አካውንት የምናስገባበት ቦታ ስም ጽፈን ነው ከዚህ በፊት የላክንባቸውን አካዉንቶች የምንፈልገዉ ነገር ግን አዲስ አካውንቶች mr ብለዉ የሚጀምሩ በዝተዋል ግን አፕልኬሽኑ space ስንጽፍ አይቀበልም ቢስተካከል	2025-06-04 00:00:00	Google Play Store	አካውንት የምናስገባበት ቦታ ስም ጽፈን ነው ከዚህ በፊት የላክንባቸውን አካዉንቶች የምንፈልገዉ ነገር ግን አዲስ አካውንቶች mr ብለዉ የሚጀምሩ በዝተዋል ግን አፕልኬሽኑ space ስንጽፍ አይቀበልም ቢስተካከል	negative	0.9616847634315491	0	neutral	0	neutral
2018	2	best	2025-06-04 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2019	2	bezabih	2025-06-04 00:00:00	Google Play Store	bezabih	positive	0.9654072523117065	0	neutral	0	neutral
2020	2	Best Mobile Banking app ever	2025-06-04 00:00:00	Google Play Store	best mobile banking app ever	positive	0.9997294545173645	0.6369	positive	1	positive
2021	2	good	2025-06-04 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2022	2	it was good app but it have some issues like it doesnt give me the right amount that I have in the bank and have some issues in transferring	2025-06-04 00:00:00	Google Play Store	good app issue like doesnt give right amount bank issue transferring	positive	0.967829167842865	0.6597	positive	0.4928571428571428	positive
2023	2	good	2025-06-04 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2024	2	Good	2025-06-04 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2025	2	👌👍	2025-06-04 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2026	2	very niec	2025-06-04 00:00:00	Google Play Store	niec	positive	0.5998042821884155	0	neutral	0	neutral
2027	2	best app of finance	2025-06-04 00:00:00	Google Play Store	best app finance	positive	0.9994705319404602	0.6369	positive	1	positive
2028	2	yetemeta	2025-06-03 00:00:00	Google Play Store	yetemeta	positive	0.6553664803504944	0	neutral	0	neutral
2029	2	Engida Kebede Fetera	2025-06-03 00:00:00	Google Play Store	engida kebede fetera	negative	0.8396738767623901	0	neutral	0	neutral
2030	2	good	2025-06-03 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2031	2	it is not safety	2025-06-03 00:00:00	Google Play Store	safety	positive	0.9971936345100403	0.4215	positive	0	neutral
2032	2	NICE bank	2025-06-03 00:00:00	Google Play Store	nice bank	positive	0.9998055100440979	0.4215	positive	0.6	positive
2033	2	it is like a childish app make it better the worst I have ever seen	2025-06-02 00:00:00	Google Play Store	like childish app make better worst ever seen	negative	0.9997608065605164	-0.2263	negative	-0.2333333333333333	negative
2034	2	It's a problem solver application, go ahead CBE, I love so much.	2025-06-02 00:00:00	Google Play Store	problem solver application go ahead cbe love much	positive	0.9991011619567871	0.3612	positive	0.35	positive
2035	2	It's good but try to make it facilitate for your client	2025-06-02 00:00:00	Google Play Store	good try make facilitate client	positive	0.9987378716468811	0.4404	positive	0.7	positive
2036	2	best app	2025-06-01 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2037	2	Awesome bank	2025-06-01 00:00:00	Google Play Store	awesome bank	positive	0.9998461008071899	0.6249	positive	1	positive
2217	2	best appearance	2025-04-27 00:00:00	Google Play Store	best appearance	positive	0.9996986389160156	0.6369	positive	1	positive
2218	2	it's very good 👍 app	2025-04-27 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2038	2	this app has developed in a very good ways but there are some comments I need to make 1- preventing the screenshot likely not good for someone like me coz I need to make screenshot for quicker evidence. 2-it would be good if you make us to access recent transaction histories for 30 days coz we don't have to go to the Bank's in person to see old transactions or add colander category so user can easily access old transactions through colanders.	2025-05-31 00:00:00	Google Play Store	app developed good way comment need make preventing screenshot likely good someone like coz need make screenshot quicker evidence would good make u access recent transaction history 30 day coz go bank person see old transaction add colander category user easily access old transaction colander	negative	0.996238112449646	0.91	positive	0.3148148148148148	positive
2039	2	Masha alla	2025-05-31 00:00:00	Google Play Store	masha alla	negative	0.9514626860618591	0	neutral	0	neutral
2040	2	Recently there is big problem when sending to safaricom, telebir, and even to cbebirr wallet could anybody who is responsible fix it, it's very frustrating it's been 5 days and my money hasn't been returned it takes it out of my account but doesn't send it to my mpesa update- they have just corrected it and sent me back the money but still I'm afraid now to send again	2025-05-31 00:00:00	Google Play Store	recently big problem sending safaricom telebir even cbebirr wallet could anybody responsible fix frustrating 5 day money returned take account send mpesa corrected sent back money still afraid send	negative	0.9985342025756836	-0.5106	negative	-0.16	negative
2041	2	better service	2025-05-31 00:00:00	Google Play Store	better service	positive	0.9982219338417053	0.4404	positive	0.5	positive
2042	2	it,s good app and time manager 👍	2025-05-30 00:00:00	Google Play Store	good app time manager	positive	0.9998489618301392	0.4404	positive	0.7	positive
2043	2	malkaamuu Jiidhaa Namoo	2025-05-30 00:00:00	Google Play Store	malkaamuu jiidhaa namoo	negative	0.9887813329696655	0	neutral	0	neutral
2044	2	lower system everything	2025-05-30 00:00:00	Google Play Store	lower system everything	negative	0.9993475079536438	-0.296	negative	0	neutral
2045	2	Nice!	2025-05-30 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2046	2	Keep it up My CBE	2025-05-29 00:00:00	Google Play Store	keep cbe	positive	0.992401123046875	0	neutral	0	neutral
2047	2	yes good	2025-05-28 00:00:00	Google Play Store	yes good	positive	0.9998410940170288	0.6808	positive	0.7	positive
2048	2	I was using this app for the last two years with no problems. It stopped working about 3 months ago. when I tried to transfer funds it gives me error "can't do this transaction. inactive account."	2025-05-27 00:00:00	Google Play Store	using app last two year problem stopped working 3 month ago tried transfer fund give error ca transaction inactive account	negative	0.9967876672744751	-0.743	negative	0	neutral
2049	2	i like everything of this app	2025-05-27 00:00:00	Google Play Store	like everything app	positive	0.9987452030181885	0.3612	positive	0	neutral
2050	2	good	2025-05-27 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2051	2	🤬🤬🤬🤬 network 🛜	2025-05-26 00:00:00	Google Play Store	network	positive	0.9776424169540405	0	neutral	0	neutral
2052	2	Best	2025-05-26 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2053	2	CBE is the best financial application and and very dimple to use. I would like to say thank you so much for the developer of application. I really appreciate this app.	2025-05-26 00:00:00	Google Play Store	cbe best financial application dimple use would like say thank much developer application really appreciate app	positive	0.9978892207145691	0.9041	positive	0.35	positive
2054	2	nice	2025-05-26 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2055	2	good job	2025-05-26 00:00:00	Google Play Store	good job	positive	0.999835729598999	0.4404	positive	0.7	positive
2056	2	Good	2025-05-25 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2057	2	it's awesome!!	2025-05-25 00:00:00	Google Play Store	awesome	positive	0.9998682737350464	0.6249	positive	1	positive
2058	2	best	2025-05-25 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2059	2	thankyou every one	2025-05-25 00:00:00	Google Play Store	thankyou every one	positive	0.9998461008071899	0	neutral	0	neutral
2060	2	best app	2025-05-25 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2061	2	Ronaldo 🇵🇹 🥇	2025-05-25 00:00:00	Google Play Store	ronaldo	positive	0.9992672801017761	0	neutral	0	neutral
2062	2	this app is absolutely fantastic I love it and I enjoying to it ,let us support this foundation together .	2025-05-25 00:00:00	Google Play Store	app absolutely fantastic love enjoying let u support foundation together	positive	0.9997773766517639	0.9407	positive	0.4666666666666666	positive
2063	2	The CBE app has been highly unreliable in recent weeks. It frequently fails to work properly on both Ethio Telecom and Safaricom networks, whether using Wi-Fi or mobile data. This week, the system was down entirely for extended periods, making it very difficult to access banking services. The app only functions intermittently, and the lack of consistency is frustrating. I hope the issues are addressed soon, and that any non-technical influences are removed from such essential services.	2025-05-25 00:00:00	Google Play Store	cbe app highly unreliable recent week frequently fails work properly ethio telecom safaricom network whether using mobile data week system entirely extended period making difficult access banking service app function intermittently lack consistency frustrating hope issue addressed soon influence removed essential service	negative	0.9995952248573303	-0.765	negative	-0.155	negative
2064	2	mortuary app	2025-05-25 00:00:00	Google Play Store	mortuary app	negative	0.7924914956092834	0	neutral	0	neutral
2065	2	it is smart app but it has stoped after some period of time on my device with out any reason .	2025-05-25 00:00:00	Google Play Store	smart app stoped period time device reason	negative	0.9639247059822083	0.4019	positive	0.21428571428571427	positive
2066	2	amazing app I am used this app for one year	2025-05-24 00:00:00	Google Play Store	amazing app used app one year	positive	0.9996716976165771	0.5859	positive	0.6000000000000001	positive
2067	2	👍	2025-05-24 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2068	2	good app	2025-05-24 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2069	2	i love it 😍😘	2025-05-24 00:00:00	Google Play Store	love	positive	0.9998735189437866	0.6369	positive	0.5	positive
961	1	Poorly functioning app	2024-12-13 00:00:00	Google Play Store	poorly functioning app	negative	0.999775230884552	0	neutral	-0.4	negative
2070	2	It makes life easy!👌	2025-05-24 00:00:00	Google Play Store	make life easy	positive	0.999527096748352	0.4404	positive	0.43333333333333335	positive
2071	2	its not fast	2025-05-24 00:00:00	Google Play Store	fast	positive	0.9989494681358337	0	neutral	0.2	positive
2072	2	wow	2025-05-24 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
2073	2	it is sooo good	2025-05-24 00:00:00	Google Play Store	sooo good	positive	0.9998644590377808	0.4404	positive	0.7	positive
2074	2	excellent	2025-05-24 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2075	2	ok	2025-05-24 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2076	2	Fantastic	2025-05-23 00:00:00	Google Play Store	fantastic	positive	0.9998743534088135	0.5574	positive	0.4	positive
2077	2	accessible to using	2025-05-23 00:00:00	Google Play Store	accessible using	positive	0.9994408488273621	0	neutral	0.375	positive
2078	2	I like it	2025-05-23 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2079	2	good	2025-05-23 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2080	2	why you change default network?	2025-05-23 00:00:00	Google Play Store	change default network	negative	0.9772279858589172	0	neutral	0	neutral
2081	2	very nice 👍	2025-05-23 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2082	2	good	2025-05-23 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2083	2	nice fast app	2025-05-23 00:00:00	Google Play Store	nice fast app	positive	0.999833345413208	0.4215	positive	0.4	positive
2084	2	good	2025-05-23 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2085	2	best	2025-05-23 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2086	2	how to I get my money	2025-05-23 00:00:00	Google Play Store	get money	negative	0.680245041847229	0	neutral	0	neutral
2087	2	Very bad, can't even load they need to improve their services.	2025-05-22 00:00:00	Google Play Store	bad ca even load need improve service	negative	0.9990552067756653	-0.1531	negative	-0.6999999999999998	negative
2088	2	Very good app, but please make it reliable . it crashes sometimes .	2025-05-22 00:00:00	Google Play Store	good app please make reliable crash sometimes	positive	0.9988992214202881	0.3612	positive	0.7	positive
2089	2	very busy I don't know why... I prefer 889	2025-05-22 00:00:00	Google Play Store	busy know prefer 889	negative	0.9723218083381653	0	neutral	0.1	positive
2090	2	Sometimes it has a nasty lag for several hour fix that , the rest is 👌	2025-05-22 00:00:00	Google Play Store	sometimes nasty lag several hour fix rest	negative	0.997215747833252	-0.7184	negative	-0.5	negative
2091	2	the most boring Mobil banking application in ethiopia.Please use alternative private banks mobile banking apps	2025-05-22 00:00:00	Google Play Store	boring mobil banking application use alternative private bank mobile banking apps	negative	0.993699312210083	-0.3182	negative	-0.5	negative
2092	2	hojii bonsaadha	2025-05-22 00:00:00	Google Play Store	hojii bonsaadha	positive	0.9568661451339722	0	neutral	0	neutral
2093	2	ok	2025-05-22 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
801	1	it's not working	2025-06-05 00:00:00	Google Play Store	working	positive	0.9987824559211731	0	neutral	0	neutral
802	1	Hello, I’m facing a problem with the BOA Mobile app. Every time I enter my phone number and password, the app crashes and shows an error that says “BoaMobile closed because this app has a bug.” I tried updating, reinstalling, and clearing cache, but nothing worked. Please fix this bug in the next update. I really need access to my account. Thank you.	2025-06-03 00:00:00	Google Play Store	hello facing problem boa mobile app every time enter phone number password app crash show error say boamobile closed app tried updating reinstalling clearing cache nothing worked please fix bug next update really need access account thank	negative	0.9981295466423035	-0.7401	negative	0.03333333333333333	neutral
803	1	exceptional	2025-06-03 00:00:00	Google Play Store	exceptional	positive	0.9998514652252197	0	neutral	0.6666666666666666	positive
804	1	BoA Mobile good bank	2025-06-02 00:00:00	Google Play Store	boa mobile good bank	positive	0.9984728693962097	0.4404	positive	0.7	positive
805	1	this is worest app 24/7 loading	2025-06-01 00:00:00	Google Play Store	worest app loading	negative	0.9912182688713074	0	neutral	0	neutral
806	1	This App is not interest for Android phone Please update it .	2025-06-01 00:00:00	Google Play Store	app interest android phone please update	positive	0.8080635666847229	0.6486	positive	0	neutral
807	1	BoA system is confartable	2025-06-01 00:00:00	Google Play Store	boa system confartable	negative	0.9988227486610413	0	neutral	0	neutral
808	1	this app, for me , is a waste of time. It doesn't work . I can't even long in, and it really piss me off. FIX THE PROBLEM	2025-05-27 00:00:00	Google Play Store	app waste time work ca even long really piss fix problem	negative	0.9983951449394226	-0.8297	negative	-0.016666666666666663	neutral
809	1	Good service.	2025-05-25 00:00:00	Google Play Store	good service	positive	0.9998499155044556	0.4404	positive	0.7	positive
810	1	the app crush frequently	2025-05-24 00:00:00	Google Play Store	app crush frequently	negative	0.9947291016578674	-0.1531	negative	0.1	positive
811	1	good	2025-05-22 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
812	1	You guys keeps getting worst	2025-05-22 00:00:00	Google Play Store	guy keep getting worst	negative	0.9995694756507874	-0.6249	negative	-1	negative
813	1	good	2025-05-21 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
884	1	what awesome apps. it is very simple to use and more much important apps.	2025-03-09 00:00:00	Google Play Store	awesome apps simple use much important apps	positive	0.9997594952583313	0.7096	positive	0.4666666666666666	positive
2094	2	ok	2025-05-22 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2095	2	user-friendly apps.because this app is easy.	2025-05-22 00:00:00	Google Play Store	app easy	positive	0.9790865778923035	0.4404	positive	0.43333333333333335	positive
2096	2	Awosome!!!	2025-05-22 00:00:00	Google Play Store	awosome	negative	0.6613028645515442	0	neutral	0	neutral
2097	2	Very good app,	2025-05-22 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2098	2	sync problem may 22 2025 but the date stack on may 8 2025 help pls	2025-05-22 00:00:00	Google Play Store	sync problem may 22 2025 date stack may 8 2025 help pls	negative	0.9966762065887451	0.0772	positive	0	neutral
814	1	This app is a joke. It crashes more than it works, takes forever to load, and half the features are just decorative at this point. Can’t log in, can’t transfer money, can’t even check my balance without it bugging out. To the developer: Are you actually trying to make this work, or is this some kind of social experiment to test our patience? Did you build this in your sleep? Because it definitely looks like it. If this is your idea of a functional app, maybe consider a different career path🙏	2025-05-21 00:00:00	Google Play Store	app joke crash work take forever load half feature decorative point log transfer money even check balance without bugging developer actually trying make work kind social experiment test patience build sleep definitely look like idea functional app maybe consider different career	negative	0.9944230914115906	0.7964	positive	0.07777777777777778	positive
815	1	BoA	2025-05-20 00:00:00	Google Play Store	boa	negative	0.7410542368888855	0	neutral	0	neutral
816	1	good	2025-05-20 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
817	1	but not opening on android	2025-05-19 00:00:00	Google Play Store	opening android	positive	0.9979572296142578	0	neutral	0	neutral
818	1	Worst App ever. Totally unreliable. And it didn't work at all for the last 4 months.	2025-05-18 00:00:00	Google Play Store	worst app ever totally unreliable work last 4 month	negative	0.9997249245643616	-0.6249	negative	-0.3333333333333333	negative
819	1	amazing	2025-05-18 00:00:00	Google Play Store	amazing	positive	0.999875545501709	0.5859	positive	0.6000000000000001	positive
820	1	excellent app	2025-05-16 00:00:00	Google Play Store	excellent app	positive	0.9998356103897095	0.5719	positive	1	positive
821	1	excellent	2025-05-15 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
822	1	ሞላዬ ከበደ	2025-05-14 00:00:00	Google Play Store	ሞላዬ ከበደ	negative	0.7850590348243713	0	neutral	0	neutral
823	1	this app does no work on Samsung a51, it just gives a preview of the logo	2025-05-11 00:00:00	Google Play Store	app work samsung a51 give preview logo	negative	0.9634434580802917	0	neutral	0	neutral
824	1	nice	2025-05-10 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
825	1	i entered incorrect security question by mistake boa app lock pin forever, why is there no other options? ?? i contacted different branchs more then 4times but they didn't able to solve this issue .	2025-05-10 00:00:00	Google Play Store	entered incorrect security question mistake boa app lock pin forever option contacted different branch 4times able solve issue	negative	0.9966102242469788	0.2023	positive	0.25	positive
826	1	Best app	2025-05-09 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
827	1	liking this application good 👍	2025-05-07 00:00:00	Google Play Store	liking application good	positive	0.999813973903656	0.6808	positive	0.7	positive
828	1	This app future is good, but there is problems with apps to reset and activate it, which is difficult even to the branch staffs, and it takes too long times to active at the branch plus most of the time high expected failure of activation after process at the counter and OTP sent not work	2025-05-06 00:00:00	Google Play Store	app future good problem apps reset activate difficult even branch staff take long time active branch plus time high expected failure activation process counter otp sent work	negative	0.9962629675865173	-0.4404	negative	-0.030000000000000002	neutral
829	1	good	2025-05-06 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
830	1	good	2025-05-02 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
831	1	good	2025-04-30 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
832	1	good	2025-04-30 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
833	1	wow	2025-04-28 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
834	1	it's really good 👍	2025-04-23 00:00:00	Google Play Store	really good	positive	0.9998512268066406	0.4927	positive	0.7	positive
835	1	Bad app . it stuck when you open and noting WORKS.	2025-04-23 00:00:00	Google Play Store	bad app stuck open noting work	negative	0.9979286193847656	-0.6705	negative	-0.3499999999999999	negative
836	1	the app isn't working after it asked me the password it starts loading, but it doesn't open	2025-04-20 00:00:00	Google Play Store	app working asked password start loading open	negative	0.9787870049476624	0	neutral	0	neutral
837	1	Best	2025-04-19 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
838	1	It keeps showing this pop up to turn off developer options even tho it's off! I had to turn on and then off to make it work! This is a horrible experience and needs a fix asap! Plus kinda slow.	2025-04-19 00:00:00	Google Play Store	keep showing pop turn developer option even tho turn make work horrible experience need fix asap plus kinda slow	negative	0.9996086955070496	-0.5423	negative	-0.65	negative
839	1	yideg	2025-04-18 00:00:00	Google Play Store	yideg	negative	0.7675821781158447	0	neutral	0	neutral
840	1	አይከፍትም እኮ	2025-04-17 00:00:00	Google Play Store	አይከፍትም እኮ	negative	0.7850590348243713	0	neutral	0	neutral
841	1	great boa	2025-04-10 00:00:00	Google Play Store	great boa	positive	0.9992689490318298	0.6249	positive	0.8	positive
842	1	Best	2025-04-10 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
843	1	boa of mobile backing	2025-04-09 00:00:00	Google Play Store	boa mobile backing	negative	0.7506159543991089	0.0258	neutral	0	neutral
844	1	nice	2025-04-09 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
845	1	faster bank of Abissinya	2025-04-08 00:00:00	Google Play Store	faster bank abissinya	negative	0.8001832962036133	0	neutral	0	neutral
846	1	i would have given it a lower if it was possible because it crush so much and it take the bank so long to fix the bug	2025-04-08 00:00:00	Google Play Store	would given lower possible crush much take bank long fix bug	negative	0.9983495473861694	-0.4215	negative	0.05000000000000001	positive
847	1	it just doesn't work...so frustrating	2025-04-07 00:00:00	Google Play Store	work frustrating	negative	0.9989427924156189	-0.4404	negative	-0.4	negative
848	1	like	2025-04-06 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
849	1	it's not work correctly... you must have update it	2025-04-06 00:00:00	Google Play Store	work correctly must update	positive	0.9969622492790222	0	neutral	0	neutral
885	1	Wonderfull app	2025-03-08 00:00:00	Google Play Store	wonderfull app	positive	0.9998815059661865	0	neutral	0	neutral
886	1	i can't use this app why?	2025-03-07 00:00:00	Google Play Store	ca use app	positive	0.8013982176780701	0	neutral	0	neutral
850	1	the app gets a considerable improvements like language , QR scanner and unlimited transfers survice. but BOA Please do alot on its fastness and convenient when we login and making a transactions.	2025-04-04 00:00:00	Google Play Store	app get considerable improvement like language qr scanner unlimited transfer survice boa please alot fastness convenient login making transaction	positive	0.7356770634651184	0.7783	positive	0.1	positive
851	1	after i typed in my password it says successfully logged out ...and goes back to the first page	2025-04-04 00:00:00	Google Play Store	typed password say successfully logged go back first page	negative	0.7724287509918213	0.4939	positive	0.3333333333333333	positive
852	1	good but they don't update enough don't add new things	2025-04-04 00:00:00	Google Play Store	good update enough add new thing	positive	0.9997918009757996	0.4404	positive	0.27878787878787875	positive
853	1	very good	2025-04-03 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
854	1	thank you	2025-04-02 00:00:00	Google Play Store	thank	positive	0.9998283386230469	0.3612	positive	0	neutral
855	1	it doesn't work period z slowest mobile banking ever i would rather use *815#	2025-04-01 00:00:00	Google Play Store	work period z slowest mobile banking ever would rather use 815	negative	0.99934321641922	0	neutral	0	neutral
856	1	after activated the application it not allowed to sign , automatically it is turn off In my phone, why ?	2025-03-31 00:00:00	Google Play Store	activated application allowed sign automatically turn phone	positive	0.6235966086387634	0	neutral	0	neutral
857	1	good application	2025-03-30 00:00:00	Google Play Store	good application	positive	0.999854564666748	0.4404	positive	0.7	positive
858	1	this version is not working for me I cannot even buy card. I cannot send money	2025-03-30 00:00:00	Google Play Store	version working even buy card send money	negative	0.9883481860160828	0	neutral	0	neutral
859	1	It can't actively on initialization, it says incorrect OTP getting the exact OTP	2025-03-29 00:00:00	Google Play Store	ca actively initialization say incorrect otp getting exact otp	negative	0.997438907623291	0.3182	positive	0.058333333333333334	positive
860	1	always problematic hardly works	2025-03-26 00:00:00	Google Play Store	always problematic hardly work	negative	0.9988321661949158	-0.4404	negative	-0.2916666666666667	negative
861	1	considering the fact the bank is huge this app really bad you could do better	2025-03-25 00:00:00	Google Play Store	considering fact bank huge app really bad could better	negative	0.9996351003646851	0.1706	positive	0.06666666666666671	positive
862	1	best app	2025-03-25 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
863	1	very good	2025-03-25 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
864	1	worst app and Bank ever u be ashamed, scammer	2025-03-24 00:00:00	Google Play Store	worst app bank ever u ashamed scammer	negative	0.9997801184654236	-0.802	negative	-1	negative
865	1	great BoA	2025-03-22 00:00:00	Google Play Store	great boa	positive	0.9992689490318298	0.6249	positive	0.8	positive
866	1	best	2025-03-21 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
867	1	i have went to the bank so many times because i couldn't make any transaction i can only see my balance nothing else so what is the point of having mobile banking if i can't make any transaction with it please work in that	2025-03-21 00:00:00	Google Play Store	went bank many time could make transaction see balance nothing else point mobile banking ca make transaction please work	positive	0.8291429877281189	0.3182	positive	0.5	positive
868	1	good	2025-03-21 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
869	1	good	2025-03-19 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
870	1	there is no speed	2025-03-19 00:00:00	Google Play Store	speed	positive	0.9994010925292969	0	neutral	0	neutral
871	1	For anyone who wants to download it, just don't!!!	2025-03-19 00:00:00	Google Play Store	anyone want download	positive	0.8904903531074524	0.0772	positive	0	neutral
872	1	wonderful	2025-03-19 00:00:00	Google Play Store	wonderful	positive	0.9998772144317627	0.5719	positive	1	positive
873	1	all worck	2025-03-19 00:00:00	Google Play Store	worck	negative	0.9761180281639099	0	neutral	0	neutral
874	1	Best app	2025-03-17 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
875	1	Loved it	2025-03-14 00:00:00	Google Play Store	loved	positive	0.999881386756897	0.5994	positive	0.7	positive
876	1	Wow	2025-03-14 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
877	1	Edit: New bug, app not letting me type in my otp codes. Shameful Why does this app not allow me to use it while having developer options on? Did y'all consider that I might, perhaps, be an actual developer? Why am I expected to toggle the option on and off just to bank (restarting my phone when I do)? Why is the message labled as somthing that will "smoothen" the experience? This is like the most "security consultant" thing to implement in an app. Please invest in actual security, not this mess.	2025-03-12 00:00:00	Google Play Store	edit new bug app letting type otp code shameful app allow use developer option consider might perhaps actual developer expected toggle option bank restarting phone message labled somthing smoothen experience like security consultant thing implement app please invest actual security mess	negative	0.9994086027145386	0.5859	positive	-0.02772727272727273	neutral
878	1	Improved to be the best	2025-03-11 00:00:00	Google Play Store	improved best	positive	0.9998138546943665	0.8074	positive	1	positive
879	1	BoA	2025-03-11 00:00:00	Google Play Store	boa	negative	0.7410542368888855	0	neutral	0	neutral
880	1	Decent, but there problems sometimes it says error When i transfer money but infact it transferred because of this bug i transferred 2 times instead of 1 and also we can't transfer money to others telebirr acc we only can to our self BOE Dev fix this !!!	2025-03-11 00:00:00	Google Play Store	decent problem sometimes say error transfer money infact transferred bug transferred 2 time instead 1 also ca transfer money others telebirr acc self boe dev fix	negative	0.996820330619812	-0.6597	negative	0.16666666666666666	positive
881	1	BoA Greqt Ethiopian bank.	2025-03-11 00:00:00	Google Play Store	boa greqt ethiopian bank	negative	0.6850442886352539	0	neutral	0	neutral
882	1	The bug is still there,the app crashes every time i try to log in, especially in old phones like my Galaxy A32	2025-03-10 00:00:00	Google Play Store	bug still app crash every time try log especially old phone like galaxy a32	negative	0.9981720447540283	0.0164	neutral	0.2	positive
883	1	Almost better compared to cbe where it is not qualified for	2025-03-09 00:00:00	Google Play Store	almost better compared cbe qualified	positive	0.9933852553367615	0.3832	positive	0.5	positive
887	1	Worst mobile banking app I ever experienced I was blaming other apps but comparing with this they're too much better!!!! It clashes it takes much longer time to login while loading in short it's a complete of trash	2025-03-06 00:00:00	Google Play Store	worst mobile banking app ever experienced blaming apps comparing much better clash take much longer time login loading short complete trash	negative	0.9997912049293518	-0.6597	negative	0.09999999999999999	positive
888	1	Wow	2025-03-05 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
889	1	bro the worst app made by human kind!! as a software engineer it make me so sad seeing enterprise as big as BOA make apps like this. it is a disgrace for our country!!	2025-03-05 00:00:00	Google Play Store	bro worst app made human kind software engineer make sad seeing enterprise big boa make apps like disgrace country	negative	0.9994205236434937	-0.6705	negative	-0.18	negative
890	1	AGA B Girja Miss language of admin Afaan oromo & other Itoophiyaa languages	2025-03-04 00:00:00	Google Play Store	aga b girja miss language admin afaan oromo itoophiyaa language	negative	0.9928743839263916	-0.1531	negative	0	neutral
891	1	Good app	2025-03-03 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
892	1	I downloaded the app for the first time while reading other customers reviews and as soon as i installed and opened the app it closes back automatically, what unserious bank, now i uninstalled the app immediately	2025-03-03 00:00:00	Google Play Store	downloaded app first time reading customer review soon installed opened app close back automatically unserious bank uninstalled app immediately	negative	0.9907559752464294	0	neutral	0.125	positive
893	1	It has good features but sometimes it doesn't work...0	2025-03-02 00:00:00	Google Play Store	good feature sometimes work 0	positive	0.9995419979095459	0.4404	positive	0.7	positive
894	1	Very poor proformance	2025-03-01 00:00:00	Google Play Store	poor proformance	negative	0.9997919201850891	-0.4767	negative	-0.4	negative
895	1	It's not opening. Really frustrating	2025-03-01 00:00:00	Google Play Store	opening really frustrating	negative	0.9983893632888794	-0.4927	negative	-0.4	negative
896	1	Verry Amazing App from all IB	2025-03-01 00:00:00	Google Play Store	verry amazing app ib	positive	0.9997125267982483	0.5859	positive	0.6000000000000001	positive
897	1	Not working on this days	2025-02-26 00:00:00	Google Play Store	working day	positive	0.9877647757530212	0	neutral	0	neutral
898	1	Thank you BoA	2025-02-23 00:00:00	Google Play Store	thank boa	positive	0.9998200535774231	0.3612	positive	0	neutral
899	1	best banking app in the wworld	2025-02-22 00:00:00	Google Play Store	best banking app wworld	positive	0.9995890259742737	0.6369	positive	1	positive
900	1	Nice app and it's easy to use	2025-02-21 00:00:00	Google Play Store	nice app easy use	positive	0.9993615746498108	0.6908	positive	0.5166666666666666	positive
901	1	please add language in the apps setting(amharic afan oromo, tigniya,and others) sometimes bank to bank transfer is not available through time and even if if it is available not reachable…it is serious issue!	2025-02-15 00:00:00	Google Play Store	please add language apps setting amharic afan oromo tigniya others sometimes bank bank transfer available time even available serious issue	negative	0.9720205068588257	0.25	positive	0.15555555555555559	positive
902	1	This is help full i like ittttt	2025-02-14 00:00:00	Google Play Store	help full like ittttt	positive	0.9263750910758972	0.6369	positive	0.35	positive
903	1	The is not functional at all?	2025-02-12 00:00:00	Google Play Store	functional	positive	0.9993332028388977	0	neutral	0	neutral
904	1	Best bank	2025-02-08 00:00:00	Google Play Store	best bank	positive	0.9997438788414001	0.6369	positive	1	positive
905	1	Make it easy and convienient to use and perfect for all to high prefrence and choice.	2025-02-07 00:00:00	Google Play Store	make easy convienient use perfect high prefrence choice	positive	0.9919643402099609	0.765	positive	0.5311111111111111	positive
906	1	good	2025-02-05 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
907	1	🇪🇹🇪🇹🇪🇹🇪🇹🇪🇹🇪🇹👍👍👍👍👍👍👍	2025-02-04 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
908	1	I have been using this app for two years.It is amazing.	2025-02-01 00:00:00	Google Play Store	using app two amazing	positive	0.9996744394302368	0.5859	positive	0.6000000000000001	positive
909	1	Good 👍	2025-01-31 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
910	1	Sad experience	2025-01-30 00:00:00	Google Play Store	sad experience	negative	0.9990687966346741	-0.4767	negative	-0.5	negative
911	1	Always do update and that is annoying	2025-01-27 00:00:00	Google Play Store	always update annoying	negative	0.99937903881073	-0.4019	negative	-0.8	negative
912	1	Best app, somehow waiting a few minutes	2025-01-23 00:00:00	Google Play Store	best app somehow waiting minute	positive	0.9328502416610718	0.6369	positive	1	positive
913	1	I can't dijitalize my atm in the apollo app on my phone	2025-01-22 00:00:00	Google Play Store	ca dijitalize atm apollo app phone	negative	0.9671255350112915	0	neutral	0	neutral
914	1	Whenever I try to sign in app close please fixed it out	2025-01-21 00:00:00	Google Play Store	whenever try sign app close please fixed	negative	0.9942448735237122	0.3182	positive	0.1	positive
915	1	Beter	2025-01-21 00:00:00	Google Play Store	beter	positive	0.6771944165229797	0	neutral	0	neutral
916	1	Boa	2025-01-18 00:00:00	Google Play Store	boa	negative	0.7410542368888855	0	neutral	0	neutral
917	1	በጣም የሚያስጠላ አፕ በጣም የወረደ ዜሮ ነው የምሰጠው ዘሮ It's not App it's very slow ehhhh. Why don't you upgrade the app???? It's always zero	2025-01-18 00:00:00	Google Play Store	በጣም የሚያስጠላ አፕ በጣም የወረደ ዜሮ ነው የምሰጠው ዘሮ app slow ehhhh upgrade app always zero	negative	0.9993040561676025	0	neutral	-0.30000000000000004	negative
918	1	Aadan Axmed Barkhadle	2025-01-17 00:00:00	Google Play Store	aadan axmed barkhadle	positive	0.6127519011497498	0	neutral	0	neutral
919	1	😡😡😡🤬🤬🤬	2025-01-16 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
920	1	Horrible customer service and app crashes Horrible!!	2025-01-15 00:00:00	Google Play Store	horrible customer service app crash horrible	negative	0.9997979998588562	-0.8658	negative	-1	negative
921	1	I love it	2025-01-14 00:00:00	Google Play Store	love	positive	0.9998735189437866	0.6369	positive	0.5	positive
922	1	Best	2025-01-14 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
960	1	The worst banking app ever. Never works!	2024-12-14 00:00:00	Google Play Store	worst banking app ever never work	negative	0.9997935891151428	-0.6249	negative	-1	negative
923	1	It keeps asking me to turn off developer mode even when dev mode is off. Couldn't use it.	2025-01-13 00:00:00	Google Play Store	keep asking turn developer mode even dev mode could use	negative	0.9962765574455261	0	neutral	0	neutral
924	1	Good🙏	2025-01-12 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
925	1	Like to much	2025-01-11 00:00:00	Google Play Store	like much	positive	0.999556839466095	0.3612	positive	0.2	positive
926	1	Thank you	2025-01-10 00:00:00	Google Play Store	thank	positive	0.9998283386230469	0.3612	positive	0	neutral
927	1	Perfect	2025-01-09 00:00:00	Google Play Store	perfect	positive	0.9998517036437988	0.5719	positive	1	positive
928	1	The best of best	2025-01-09 00:00:00	Google Play Store	best best	positive	0.9998223185539246	0.8555	positive	1	positive
929	1	I was using this app for long time it amazing user friendly UI but the i can't found for get pin button in the app	2025-01-07 00:00:00	Google Play Store	using app long time amazing user friendly ui ca found get pin button app	positive	0.9967617392539978	0.7906	positive	0.30833333333333335	positive
930	1	Boa	2025-01-06 00:00:00	Google Play Store	boa	negative	0.7410542368888855	0	neutral	0	neutral
931	1	Great 👍	2025-01-04 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
932	1	Fast and suitable for the customers.	2025-01-04 00:00:00	Google Play Store	fast suitable customer	positive	0.9997313618659973	0	neutral	0.375	positive
933	1	Good 👍	2025-01-03 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
934	1	Good app and helpful	2025-01-03 00:00:00	Google Play Store	good app helpful	positive	0.9997825026512146	0.6908	positive	0.7	positive
935	1	I will give only one star, because it faced with multiple of problems. 1. The app is not as fast as the other banks App, for e.g like CBE 2. The App asks repeatedly to switch off developer options, even if it is switched off. 3. Bank of Abyssinia's services are interesting, but they ignored the issues on the App service. 4. Most customers gave a complain on the App, but no one accept their complain to fix the issue. 5. Lastly, I will not recommend the App unless the issue has been solved ASAP!!	2025-01-03 00:00:00	Google Play Store	give one star faced multiple problem app fast bank app like cbe app asks repeatedly switch developer option even switched bank abyssinia service interesting ignored issue app service customer gave complain app one accept complain fix issue lastly recommend app unless issue solved asap	negative	0.9958153367042542	0.34	positive	0.175	positive
936	1	By assessing this you can tell Abyssinia bank has no idea what mobile banking is ?	2025-01-02 00:00:00	Google Play Store	assessing tell abyssinia bank idea mobile banking	negative	0.9230318665504456	0	neutral	0	neutral
937	1	It doesn't work at all.	2025-01-02 00:00:00	Google Play Store	work	positive	0.9994449019432068	0	neutral	0	neutral
938	1	this app is not available	2025-01-02 00:00:00	Google Play Store	app available	positive	0.9953263998031616	0	neutral	0.4	positive
939	1	Best	2025-01-01 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
940	1	Wow what amazing	2024-12-30 00:00:00	Google Play Store	wow amazing	positive	0.9998724460601807	0.8225	positive	0.35000000000000003	positive
941	1	love it	2024-12-30 00:00:00	Google Play Store	love	positive	0.9998735189437866	0.6369	positive	0.5	positive
942	1	በጣም መሻሻል አለበት....... ለ ባንኩ ማይመጥን መተግበርያ ነው ::	2024-12-30 00:00:00	Google Play Store	በጣም መሻሻል አለበት ለ ባንኩ ማይመጥን መተግበርያ ነው	negative	0.9239576458930969	0	neutral	0	neutral
943	1	Lemn embi yilal??	2024-12-30 00:00:00	Google Play Store	lemn embi yilal	negative	0.8609251976013184	0	neutral	0	neutral
944	1	Good	2024-12-30 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
945	1	It's useless app downgraded.	2024-12-29 00:00:00	Google Play Store	useless app downgraded	negative	0.9997947812080383	-0.4215	negative	-0.5	negative
946	1	Why is not letting me access my account. The whole point of this app is for me to gey access to my account without physically being at the bank. I would give it a zero but a one will suffice to get my point accross.	2024-12-27 00:00:00	Google Play Store	letting access account whole point app gey access account without physically bank would give zero one suffice get point accross	negative	0.9909530878067017	0	neutral	0.1	positive
947	1	Nice	2024-12-26 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
948	1	When are you going to get rid of this and have a real app that works? By far the worst mobile banking app.	2024-12-24 00:00:00	Google Play Store	going get rid real app work far worst mobile banking app	negative	0.9997583031654358	-0.6249	negative	-0.2333333333333333	negative
949	1	አይሰራም ሼም ነው፤	2024-12-23 00:00:00	Google Play Store	አይሰራም ሼም	negative	0.7850590348243713	0	neutral	0	neutral
950	1	Not that much bad	2024-12-22 00:00:00	Google Play Store	much bad	negative	0.9998047947883606	-0.5423	negative	-0.6999999999999998	negative
951	1	Fine	2024-12-21 00:00:00	Google Play Store	fine	positive	0.9998335838317871	0.2023	positive	0.4166666666666667	positive
952	1	The dirtiest application ever seen...	2024-12-20 00:00:00	Google Play Store	dirtiest application ever seen	negative	0.9929673671722412	-0.5267	negative	0	neutral
953	1	Nic ap	2024-12-19 00:00:00	Google Play Store	nic ap	positive	0.9873360991477966	0	neutral	0	neutral
954	1	The forest app ever	2024-12-19 00:00:00	Google Play Store	forest app ever	positive	0.9739094376564026	0	neutral	0	neutral
955	1	I love BoA more than anyone but they are cursed when it comed to mobile banking. Even though this ine is hetter it still s*cks! It will ask me to turn off developer options other wise it won't work! I use CBE, Awash birr, tekebirr, Dashen bank and others but non of them asked me this, why only BoA? Please improve your mobile banking, be competitive!	2024-12-19 00:00:00	Google Play Store	love boa anyone cursed comed mobile banking even though ine hetter still cks ask turn developer option wise wo work use cbe awash birr tekebirr dashen bank others non asked boa please improve mobile banking competitive	negative	0.9053539633750916	0.9217	positive	0.6	positive
956	1	Bank of abissena	2024-12-17 00:00:00	Google Play Store	bank abissena	positive	0.8258541822433472	0	neutral	0	neutral
957	1	Good	2024-12-16 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
958	1	Easy and sooo simple to use it, also its easy to stole someones money using the app	2024-12-16 00:00:00	Google Play Store	easy sooo simple use also easy stole someone money using app	negative	0.9966411590576172	0.7003	positive	0.2888888888888889	positive
959	1	GOOD	2024-12-15 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
962	1	Very nice	2024-12-13 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
963	1	Your system is the worst you should do better😡😡😡😡😡😡	2024-12-11 00:00:00	Google Play Store	system worst	negative	0.9998070597648621	-0.6249	negative	-1	negative
964	1	It has been a while since you guys started giving the mobile app service but still couldn't get it to work. I'm sure you know that it doesn't work already but not sure if you're lazy or incompetent to fix it. You are losing business because of this. Complacency will have consequences.	2024-12-10 00:00:00	Google Play Store	since guy started giving mobile app service still could get work sure know work already sure lazy incompetent fix losing business complacency consequence	negative	0.9994496703147888	-0.296	negative	0.1	positive
965	1	This is the best app; many features are awesome, but it should work without the need to turn off the developer options. I'm tired of having to constantly switch the developer options off and on. I've been expressing my struggles about this. I have precious settings enabled in the developer options, and to open the App Boa app, I have to turn them off. Please help us, Abyssinia Bank. I hope you can provide an update soon.	2024-12-08 00:00:00	Google Play Store	best app many feature awesome work without need turn developer option tired constantly switch developer option expressing struggle precious setting enabled developer option open app boa app turn please help u abyssinia bank hope provide update soon	positive	0.9975213408470154	0.9403	positive	0.37142857142857144	positive
966	1	I’m giving this app one star because there are no options below that. My experience has been incredibly frustrating due to the extremely long loading times, and the app even closes automatically at times. People choose mobile banking for its convenience, but this app is far too time-consuming, making it the worst I’ve used. I hope improvements are made to enhance the user experience.	2024-12-07 00:00:00	Google Play Store	giving app one star option experience incredibly frustrating due extremely long loading time app even close automatically time people choose mobile banking convenience app far making worst used hope improvement made enhance user experience	negative	0.9941813349723816	0.0018	neutral	-0.29500000000000004	negative
967	1	Nice	2024-12-07 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
968	1	Very unprofessional and mischievous bank in my opinion. I have had several occasions but recently I used Abyssinia Card to withdraw money and it was deducted from my account but despite reporting several times they said they are processing it but I learned yesterday that since it has been 3 months the bank has decided to include it in their income. How absurd. If you can avoid this bank.	2024-12-06 00:00:00	Google Play Store	unprofessional mischievous bank opinion several occasion recently used abyssinia card withdraw money deducted account despite reporting several time said processing learned yesterday since 3 month bank decided include income absurd avoid bank	negative	0.9920478463172913	-0.6705	negative	-0.125	negative
969	1	It doesn't work on my 2 devices A05 and A34 😡	2024-12-02 00:00:00	Google Play Store	work 2 device a05 a34	negative	0.9139236211776733	0	neutral	0	neutral
970	1	It's better to say I don't use boa rather than pulling your phone out and opening this app	2024-12-01 00:00:00	Google Play Store	better say use boa rather pulling phone opening app	negative	0.998244047164917	0.4404	positive	0.5	positive
971	1	My attention is very important because it will be the most difficult time for me	2024-11-30 00:00:00	Google Play Store	attention important difficult time	negative	0.9522916078567505	-0.1779	negative	-0.04999999999999999	neutral
972	1	I have a worst experience while using this mobile application through out the year. Most of the time it fails to "Login" or automatically closed the app. And also it takes so much loading time (5 minutes +) trying to access the internal services. Sometimes also while transferring within and to other bank also fails. So, BOA please fix your app.	2024-11-29 00:00:00	Google Play Store	worst experience using mobile application year time fails login automatically closed app also take much loading time 5 minute trying access internal service sometimes also transferring within bank also fails boa please fix app	negative	0.9996033310890198	-0.8126	negative	-0.3166666666666667	negative
973	1	I don't know why but your apps start out great then all of a sudden don't work🤷‍♀️	2024-11-28 00:00:00	Google Play Store	know apps start great sudden	positive	0.9991416931152344	0.6249	positive	0.4	positive
974	1	This application is losing major factions on a daily basis. I can count how many times I have used this app; it is completely useless and disappointing if I am not going to use it in times of need then I don't see the point.	2024-11-28 00:00:00	Google Play Store	application losing major faction daily basis count many time used app completely useless disappointing going use time need see point	negative	0.9992867112159729	-0.847	negative	-0.1075	negative
975	1	exellent digital transaction of money	2024-11-27 00:00:00	Google Play Store	exellent digital transaction money	negative	0.9978858828544617	0	neutral	0	neutral
976	1	The latest update has stopped android 9 phones not to open this App. Never work properly since i started using it.	2024-11-26 00:00:00	Google Play Store	latest update stopped android 9 phone open app never work properly since started using	negative	0.9993312358856201	-0.2263	negative	0.16666666666666666	positive
977	1	Best	2024-11-25 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
978	1	Great	2024-11-25 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
979	1	👏👏👏	2024-11-24 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
980	1	Money	2024-11-24 00:00:00	Google Play Store	money	positive	0.9659326076507568	0	neutral	0	neutral
981	1	It needs more improvment	2024-11-24 00:00:00	Google Play Store	need improvment	negative	0.9674727320671082	0	neutral	0	neutral
982	1	Hey Google	2024-11-21 00:00:00	Google Play Store	hey google	positive	0.9950044751167297	0	neutral	0	neutral
983	1	Good app	2024-11-21 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
984	1	ab	2024-11-20 00:00:00	Google Play Store	ab	positive	0.9603192806243896	0	neutral	0	neutral
985	1	Ademtahir	2024-11-20 00:00:00	Google Play Store	ademtahir	positive	0.9930111765861511	0	neutral	0	neutral
986	1	✌️✌️	2024-11-20 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
987	1	Please this app on my android phone	2024-11-20 00:00:00	Google Play Store	please app android phone	positive	0.9795334339141846	0.3182	positive	0	neutral
988	1	GOAT 🐐 🐐	2024-11-19 00:00:00	Google Play Store	goat	negative	0.9739651679992676	0	neutral	0	neutral
1057	1	It's easy used to operate program and secured 👍👍	2024-09-25 00:00:00	Google Play Store	easy used operate program secured	negative	0.8629269599914551	0.6808	positive	0.43333333333333335	positive
989	1	Your app doesn't match your bank, the app is disaster, super slow. Please learn something from tele birr app.	2024-11-19 00:00:00	Google Play Store	app match bank app disaster super slow please learn something tele birr app	negative	0.9981170892715454	0.2732	positive	0.016666666666666635	neutral
990	1	Fast and reliable	2024-11-18 00:00:00	Google Play Store	fast reliable	positive	0.9998382329940796	0	neutral	0.2	positive
991	1	The worst app update ever. Why would you include the "developer option off" thing here? Why do you care? It is my phone my money, right? That is the reason why I switched to other banks. So either turn it off or everyone will discontinue their business one by one.	2024-11-17 00:00:00	Google Play Store	worst app update ever would include developer option thing care phone money right reason switched bank either turn everyone discontinue business one one	negative	0.9997963309288025	-0.2263	negative	-0.35714285714285715	negative
992	1	Very good	2024-11-14 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
993	1	One of the poorest mobile banking system	2024-11-13 00:00:00	Google Play Store	one poorest mobile banking system	negative	0.9997370839118958	-0.5423	negative	0	neutral
994	1	❤❤❤❤❤❤	2024-11-12 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
995	1	Oene	2024-11-12 00:00:00	Google Play Store	oene	positive	0.8278864026069641	0	neutral	0	neutral
996	1	i find it interesting specially in reciept downloading	2024-11-12 00:00:00	Google Play Store	find interesting specially reciept downloading	positive	0.9934402108192444	0.4019	positive	0.4285714285714286	positive
997	1	it good	2024-11-12 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
998	1	This app crashes everytime, please fix it	2024-11-12 00:00:00	Google Play Store	app crash everytime please fix	negative	0.997086226940155	-0.1027	negative	0	neutral
999	1	አንድ star ራሱ ይበዛበታል። i dont recomend to use this app also the bank	2024-11-12 00:00:00	Google Play Store	አንድ star ራሱ dont recomend use app also bank	negative	0.9906750321388245	0	neutral	0	neutral
1000	1	I need a support the app is not working	2024-11-12 00:00:00	Google Play Store	need support app working	positive	0.6164344549179077	0.4019	positive	0	neutral
1001	1	Bast bank of ethiopia	2024-11-12 00:00:00	Google Play Store	bast bank ethiopia	positive	0.9939870834350586	0	neutral	0	neutral
1002	1	Good	2024-11-12 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1003	1	very slow app. አቢሲኒያን ከሚያክል ባንክ የማይጠበቅ software app. ከቻላችሁ ሙሉ ለሙሉ እንደገና አሰሩት።በጣም ይመራያል ያሳፍራል።ለapp የወጣው ወጭ በሙስና የተበላ ነው የሚመስለው።	2024-11-12 00:00:00	Google Play Store	slow app አቢሲኒያን ከሚያክል ባንክ የማይጠበቅ software app ከቻላችሁ ሙሉ ለሙሉ እንደገና ይመራያል የወጣው ወጭ በሙስና የተበላ ነው	negative	0.9957073926925659	0	neutral	-0.30000000000000004	negative
1004	1	thank you for your social services like, vertual banking, non touch ATM, Cadrless and withdrwal with out passbook...	2024-11-12 00:00:00	Google Play Store	thank social service like vertual banking non touch atm cadrless withdrwal passbook	positive	0.9902560114860535	0.6124	positive	0.03333333333333333	neutral
1005	1	The worst App i have never seen like this before	2024-11-12 00:00:00	Google Play Store	worst app never seen like	negative	0.9997345805168152	-0.7359	negative	-1	negative
1006	1	Wweeeer	2024-11-12 00:00:00	Google Play Store	wweeeer	negative	0.8910733461380005	0	neutral	0	neutral
1007	1	Infinx	2024-11-12 00:00:00	Google Play Store	infinx	negative	0.904255747795105	0	neutral	0	neutral
1008	1	Great service	2024-11-12 00:00:00	Google Play Store	great service	positive	0.9998434782028198	0.6249	positive	0.8	positive
1009	1	👍	2024-11-11 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
1010	1	This app is not available on all android versions and some times it is not functional.	2024-11-08 00:00:00	Google Play Store	app available android version time functional	positive	0.515074610710144	0	neutral	0.4	positive
1011	1	senayt Mesfin	2024-11-08 00:00:00	Google Play Store	senayt mesfin	positive	0.887482225894928	0	neutral	0	neutral
1012	1	Bad app vety bad.	2024-11-07 00:00:00	Google Play Store	bad app vety bad	negative	0.9998015761375427	-0.7906	negative	-0.6999999999999998	negative
1013	1	Nice	2024-11-06 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
1014	1	Abessnya Banke	2024-11-05 00:00:00	Google Play Store	abessnya banke	negative	0.9873653054237366	0	neutral	0	neutral
1015	1	The most useless app, I never expected such an irrelevant app from BOA. big shame!	2024-11-04 00:00:00	Google Play Store	useless app never expected irrelevant app boa big shame	negative	0.9988825917243958	-0.7096	negative	-0.2375	negative
1016	1	Okay	2024-11-03 00:00:00	Google Play Store	okay	positive	0.9997709393501282	0.2263	positive	0.5	positive
1017	1	Professional on banking app	2024-11-01 00:00:00	Google Play Store	professional banking app	positive	0.8753941655158997	0	neutral	0.1	positive
1018	1	Has some nice interface but always freezes or slow to load .App developers please fix this issue.	2024-10-27 00:00:00	Google Play Store	nice interface always freeze slow load developer please fix issue	negative	0.9223189353942871	0.6486	positive	0.14999999999999997	positive
1019	1	አይሰራም አስተካክሉት	2024-10-26 00:00:00	Google Play Store	አይሰራም አስተካክሉት	negative	0.7850590348243713	0	neutral	0	neutral
1020	1	Please try another because this app doesn't feet the need of this generation	2024-10-25 00:00:00	Google Play Store	please try another app foot need generation	negative	0.9851754307746887	0.3182	positive	0	neutral
1021	1	Good	2024-10-25 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1022	1	Fast transfer	2024-10-24 00:00:00	Google Play Store	fast transfer	positive	0.9989985823631287	0	neutral	0.2	positive
1023	1	What's up I can't log in, what's wrong	2024-10-22 00:00:00	Google Play Store	ca log wrong	negative	0.9991542100906372	-0.4767	negative	-0.5	negative
1024	1	Amrumehamed	2024-10-21 00:00:00	Google Play Store	amrumehamed	positive	0.6924042105674744	0	neutral	0	neutral
1025	1	Good	2024-10-19 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1056	1	That's too good application but try to add more alternatives and futures or possibilitys for your customers	2024-09-25 00:00:00	Google Play Store	good application try add alternative future possibility customer	positive	0.9945331811904907	0.4404	positive	0.35	positive
1087	1	Fast one	2024-09-04 00:00:00	Google Play Store	fast one	positive	0.9994491934776306	0	neutral	0.2	positive
1026	1	Nice to meet you my proud bank in Ethiopia.. I'm a member of this bank, i need to solve my problem of international receiving money for me from my online digital working service's over the world please? I'm working a lot of international money.But i can't get direct in Ethiopia because of don't knowing the legal ways of getting money in Ethiopia please can I get and direct deposit with BoA please 🙏🙏🙏?	2024-10-18 00:00:00	Google Play Store	nice meet proud bank ethiopia member bank need solve problem international receiving money online digital working service world please working lot international ca get direct ethiopia knowing legal way getting money ethiopia please get direct deposit boa please	positive	0.8354548215866089	0.886	positive	0.225	positive
1027	1	Very good	2024-10-18 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1028	1	ደደገነሐ	2024-10-15 00:00:00	Google Play Store	ደደገነሐ	negative	0.6970565915107727	0	neutral	0	neutral
1029	1	Terrible Bank Experience It’s unbelievable that with all the modern technology, this bank still struggles with even basic transactions. The app constantly crashes, services are limited, and every time I try to transfer money or load Telebirr, there’s a huge delay. I have to wait 5 days for failed transactions to be refunded! Even USSD is unreliable. They’ve put me in embarrassing situations countless times, and customer care never fixes anything. I’ve switched banks, and you should too!	2024-10-14 00:00:00	Google Play Store	terrible bank experience unbelievable modern technology bank still struggle even basic transaction app constantly crash service limited every time try transfer money load telebirr huge delay wait 5 day failed transaction refunded even ussd unreliable put embarrassing situation countless time customer care never fix anything switched bank	negative	0.9981858134269714	-0.872	negative	-0.13571428571428573	negative
1030	1	A painfully slow banking app service. Please don't make it your choice!	2024-10-13 00:00:00	Google Play Store	painfully slow banking app service please make choice	negative	0.9989803433418274	-0.2732	negative	-0.30000000000000004	negative
1031	1	Good App	2024-10-12 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
1032	1	Best app to me	2024-10-11 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
1033	1	BOA	2024-10-11 00:00:00	Google Play Store	boa	negative	0.7410542368888855	0	neutral	0	neutral
1034	1	Abdulkadir	2024-10-11 00:00:00	Google Play Store	abdulkadir	positive	0.981449544429779	0	neutral	0	neutral
1035	1	Bad	2024-10-10 00:00:00	Google Play Store	bad	negative	0.999782383441925	-0.5423	negative	-0.6999999999999998	negative
1036	1	If it is possible I would gove0 star	2024-10-08 00:00:00	Google Play Store	possible would gove0 star	negative	0.8787209987640381	0	neutral	0	neutral
1037	1	Nise mobile bankig	2024-10-05 00:00:00	Google Play Store	nise mobile bankig	negative	0.9858755469322205	0	neutral	0	neutral
1038	1	Overall good app but performance needs some improvement also sometimes when using instant other bank transfers it refuses causing to be repeated several times to transfer	2024-10-04 00:00:00	Google Play Store	overall good app performance need improvement also sometimes using instant bank transfer refuse causing repeated several time transfer	negative	0.9793716669082642	0.5719	positive	0.175	positive
1039	1	Ok	2024-10-04 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1040	1	Just make it work please🤣 this is embarrassing for a bank of your size	2024-10-04 00:00:00	Google Play Store	make work embarrassing bank size	negative	0.9997360110282898	-0.3818	negative	0	neutral
1041	1	Update to the simplest way it requires the developer option on and off why this is	2024-10-04 00:00:00	Google Play Store	update simplest way requires developer option	negative	0.9625688791275024	0	neutral	0	neutral
1042	1	Stop telling me what to do with my phone, BOA. Why does your newly updated app keep asking me to disable the developer options? I’m not slowing down my phone just to use your God damn app. 🤮🤮🤮🤮	2024-10-04 00:00:00	Google Play Store	stop telling phone boa newly updated app keep asking disable developer option slowing phone use god damn app	negative	0.998467743396759	-0.4215	negative	0.13636363636363635	positive
1043	1	I'm living out of country how may I download and use mobile banking? It asks me the Ethiopia phone number and I can't receive text to confirm because I'm out side the country. So please lete know if I can use while I'm outside the country. Thanks	2024-10-04 00:00:00	Google Play Store	living country may download use mobile banking asks ethiopia phone number ca receive text confirm side country please lete know use outside country thanks	positive	0.70750892162323	0.6705	positive	0.1	positive
1044	1	Good	2024-10-03 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1045	1	Worest app	2024-10-03 00:00:00	Google Play Store	worest app	negative	0.7789772152900696	0	neutral	0	neutral
1046	1	The worest app ever	2024-10-03 00:00:00	Google Play Store	worest app ever	positive	0.9283795356750488	0	neutral	0	neutral
1047	1	አሪፍ ነው በርቱልን	2024-10-03 00:00:00	Google Play Store	አሪፍ ነው በርቱልን	negative	0.8337252736091614	0	neutral	0	neutral
1048	1	Wwwerrr	2024-10-02 00:00:00	Google Play Store	wwwerrr	negative	0.8502515554428101	0	neutral	0	neutral
1049	1	ጀማል ውቀቱ	2024-09-30 00:00:00	Google Play Store	ጀማል ውቀቱ	negative	0.7850590348243713	0	neutral	0	neutral
1050	1	Great For Financial company	2024-09-30 00:00:00	Google Play Store	great financial company	positive	0.9998753070831299	0.6249	positive	0.4	positive
1051	1	Very easy to use	2024-09-30 00:00:00	Google Play Store	easy use	positive	0.9884273409843445	0.4404	positive	0.43333333333333335	positive
1052	1	The App's crash always.. Error.....	2024-09-27 00:00:00	Google Play Store	app crash always error	negative	0.9992274045944214	-0.6597	negative	0	neutral
1053	1	This app is incredibly frustrating to use. It’s filled with issues that make it difficult to navigate and complete tasks efficiently. I’ve never encountered such a poorly designed banking application before. It needs significant improvements to enhance user experience. It deserves a vey low rating.	2024-09-26 00:00:00	Google Play Store	app incredibly frustrating use filled issue make difficult navigate complete task efficiently never encountered poorly designed banking application need significant improvement enhance user experience deserves vey low rating	negative	0.9781351089477539	-0.0754	negative	-0.06071428571428572	negative
1054	1	nice	2024-09-26 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
1055	1	Great UI and seamless UX. I love it!!	2024-09-25 00:00:00	Google Play Store	great ui seamless ux love	positive	0.9994181394577026	0.8519	positive	0.4666666666666666	positive
1160	1	this is so disappointing app 😞	2024-07-31 00:00:00	Google Play Store	disappointing app	negative	0.9997482895851135	-0.4939	negative	-0.6	negative
1058	1	I bought a mobile card on this app but I didn't receive it and it took my money and I didn't get my money back.	2024-09-21 00:00:00	Google Play Store	bought mobile card app receive took money get money back	negative	0.990920901298523	0	neutral	0	neutral
1059	1	Amazing	2024-09-19 00:00:00	Google Play Store	amazing	positive	0.999875545501709	0.5859	positive	0.6000000000000001	positive
1060	1	Great app with great services	2024-09-19 00:00:00	Google Play Store	great app great service	positive	0.999742329120636	0.8481	positive	0.8	positive
1061	1	Yes active user	2024-09-17 00:00:00	Google Play Store	yes active user	positive	0.9983929991722107	0.6597	positive	-0.13333333333333333	negative
1062	1	Shameful	2024-09-17 00:00:00	Google Play Store	shameful	negative	0.998016357421875	-0.4939	negative	0	neutral
1063	1	The worest app ever made i would not recommende for no one	2024-09-16 00:00:00	Google Play Store	worest app ever made would recommende one	positive	0.8708882331848145	0	neutral	0	neutral
1064	1	Good application	2024-09-16 00:00:00	Google Play Store	good application	positive	0.999854564666748	0.4404	positive	0.7	positive
1065	1	I like	2024-09-16 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
1066	1	Good	2024-09-16 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1067	1	How many hours should I wait after transferring money to telebirr, please do something about the transfer delay issue I need my money when ever.	2024-09-15 00:00:00	Google Play Store	many hour wait transferring money telebirr please something transfer delay issue need money ever	negative	0.9941322207450867	0	neutral	0.5	positive
1068	1	BOA is unreasonably holding and delaying transactions for more than a day, even transactions within the same bank itself. This is a huge gap that I observed in BOA mobile banking. I didn't experience this kind of challenge while having transactions in other banks' mobile banking platforms. After waiting so long, I called your customer support team and the response they gave me was "it was the system that holds the transaction & will be released on working days". This is not totally fair.	2024-09-15 00:00:00	Google Play Store	boa unreasonably holding delaying transaction day even transaction within bank huge gap observed boa mobile banking experience kind challenge transaction bank mobile banking platform waiting long called customer support team response gave system hold transaction released working day totally fair	positive	0.7828158736228943	0.8832	positive	0.4125	positive
1069	1	የእርስዎን ተሞክሮ ይግለጹ (አማራጭ)	2024-09-14 00:00:00	Google Play Store	የእርስዎን ተሞክሮ ይግለጹ አማራጭ	negative	0.8616330027580261	0	neutral	0	neutral
1070	1	It's not working. It needs a big update. Can't you update the app quickly?	2024-09-14 00:00:00	Google Play Store	working need big update ca update app quickly	negative	0.9907553791999817	0	neutral	0.16666666666666666	positive
1071	1	I am Aimohon Joel , It's can be Good for a Better Conversation in Time 🙂	2024-09-14 00:00:00	Google Play Store	aimohon joel good better conversation time	positive	0.9943663477897644	0.7003	positive	0.6	positive
1072	1	Better app than most mobile apps, but why do I have to turn off developer option every time I wanna use the app?? It's annoying.	2024-09-13 00:00:00	Google Play Store	better app mobile apps turn developer option every time wan na use app annoying	negative	0.9908928871154785	0.0516	positive	-0.16666666666666666	negative
1073	1	Bes and freindly app	2024-09-13 00:00:00	Google Play Store	be freindly app	negative	0.9479008913040161	0	neutral	0	neutral
1074	1	It doesn't work.	2024-09-12 00:00:00	Google Play Store	work	positive	0.9994449019432068	0	neutral	0	neutral
1075	1	It say "The request was not successful. please check device connectivity or try again" why? One of the bank manager told me it is because of my phone's android version which is 9.1 It is ridiculous! Disappointing	2024-09-11 00:00:00	Google Play Store	say request successful please check device connectivity try one bank manager told phone android version ridiculous disappointing	negative	0.9996609687805176	0.1027	positive	-0.061111111111111095	negative
1076	1	How to download or screenshot of payment receipt...what kinda worst app ever 🤮🤮🤢	2024-09-11 00:00:00	Google Play Store	download screenshot payment receipt kinda worst app ever	negative	0.9997838139533997	-0.5868	negative	-1	negative
1077	1	Good	2024-09-10 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1078	1	Smart technology	2024-09-10 00:00:00	Google Play Store	smart technology	positive	0.9998468160629272	0.4019	positive	0.21428571428571427	positive
1079	1	Yegema app tish🪨	2024-09-08 00:00:00	Google Play Store	yegema app	positive	0.5369091629981995	0	neutral	0	neutral
1080	1	Ok	2024-09-07 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1081	1	This is not an appropriate app, i don't know how boa develops this app, i don't expect this much crazy and un confortable app form BOA, I'm soory!!!	2024-09-07 00:00:00	Google Play Store	appropriate app know boa develops app expect much crazy un confortable app form boa soory	negative	0.9914036393165588	-0.34	negative	-0.04999999999999999	neutral
1082	1	Shockingly bad! Even when it decides to work, it's painfully slow and frustrating. Such a shame that it has become a stain on an extraordinary bank	2024-09-06 00:00:00	Google Play Store	shockingly bad even decides work painfully slow frustrating shame become stain extraordinary bank	negative	0.9996724128723145	-0.9274	negative	-0.26666666666666666	negative
1083	1	It crashes frequently. It launches on Android 8.1 but I don't think it actually works on versions less than 10. If so, it shouldn't be available for download by such devices to begin with, like many other finance apps are not. It was so much better three months ago, upgrades should be for the better.	2024-09-06 00:00:00	Google Play Store	crash frequently launch android think actually work version less available download device begin like many finance apps much better three month ago upgrade better	negative	0.998531699180603	0.6808	positive	0.2619047619047619	positive
1084	1	Awesome application. But lately its crashing everytime i opened it.	2024-09-05 00:00:00	Google Play Store	awesome application lately crashing everytime opened	positive	0.9957851767539978	0.6249	positive	0.35	positive
1085	1	እጅም በጣም ደካማ አፕ ነው ሲፈልግ ይከፍታል ሲፈልግ አይከፍትም ከአዋሽ እና ንግድ ባንክ የመሳሰሉ ባንኮች ሲወዳደር ሞባይል ባንኪንግ App እጅግ የሚያበሳጭ ነው ለውጥ ያስፈልጋችኋል	2024-09-05 00:00:00	Google Play Store	እጅም በጣም ደካማ አፕ ነው ሲፈልግ ይከፍታል ሲፈልግ አይከፍትም ከአዋሽ እና ንግድ ባንክ የመሳሰሉ ባንኮች ሲወዳደር ሞባይል ባንኪንግ app እጅግ የሚያበሳጭ ነው ለውጥ ያስፈልጋችኋል	negative	0.9639249444007874	0	neutral	0	neutral
1086	1	good	2024-09-05 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1088	1	Nice looking app but a terrible user experience.	2024-09-03 00:00:00	Google Play Store	nice looking app terrible user experience	negative	0.9853790998458862	-0.0772	negative	-0.2	negative
1089	1	The worest MB app ever!!🙄	2024-09-02 00:00:00	Google Play Store	worest mb app ever	negative	0.954889178276062	0	neutral	0	neutral
1090	1	Very good	2024-09-01 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1091	1	It is ok	2024-09-01 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1092	1	Plz fix the Apps ....screenshot lovation hide from glarey share botten not work😔😔	2024-08-30 00:00:00	Google Play Store	plz fix apps screenshot lovation hide glarey share botten	negative	0.9982648491859436	0.2023	positive	0	neutral
1093	1	Good	2024-08-30 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1094	1	Apollo's	2024-08-29 00:00:00	Google Play Store	apollo	positive	0.9962450861930847	0	neutral	0	neutral
1095	1	The worst experience ever	2024-08-29 00:00:00	Google Play Store	worst experience ever	negative	0.9997971653938293	-0.6249	negative	-1	negative
1096	1	Hussenaliumar	2024-08-29 00:00:00	Google Play Store	hussenaliumar	negative	0.6654537916183472	0	neutral	0	neutral
1097	1	Good	2024-08-28 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1098	1	Hi I have problem with this App BOA mobile I don't know what is wrong with this App I did many times download but it's sam doesn't work if sam like that this app way I have to be customer with them how I know my account and checking save The book is no Not enough alone	2024-08-28 00:00:00	Google Play Store	hi problem app boa mobile know wrong app many time download sam work sam like app way customer know account checking save book enough alone	negative	0.9961128234863281	-0.2732	negative	0	neutral
1099	1	It is not work for my device	2024-08-27 00:00:00	Google Play Store	work device	positive	0.9735199213027954	0	neutral	0	neutral
1100	1	I'm Sick and tiered of enabling and disabling Developer Option Everytime I use this app. maybe you know it maybe you dont, fix it please it's anoying	2024-08-26 00:00:00	Google Play Store	sick tiered enabling disabling developer option everytime use app maybe know maybe dont fix please anoying	negative	0.9998047947883606	-0.8106	negative	-0.7142857142857143	negative
1101	1	The worst app ever	2024-08-26 00:00:00	Google Play Store	worst app ever	negative	0.9997803568840027	-0.6249	negative	-1	negative
1102	1	Good	2024-08-26 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1103	1	Betanya Gebre	2024-08-23 00:00:00	Google Play Store	betanya gebre	positive	0.8911886215209961	0	neutral	0	neutral
1104	1	I dont recommand it to any one	2024-08-23 00:00:00	Google Play Store	dont recommand one	negative	0.9899094104766846	0	neutral	0	neutral
1105	1	Good	2024-08-22 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1106	1	Excellent app	2024-08-21 00:00:00	Google Play Store	excellent app	positive	0.9998356103897095	0.5719	positive	1	positive
1107	1	The application used to work well. But after updates I'm not able to use the forgot password feature, which is blocking me from accessing it as a whole.	2024-08-20 00:00:00	Google Play Store	application used work well update able use forgot password feature blocking accessing whole	negative	0.9943991303443909	-0.128	negative	0.35	positive
1108	1	ትርሃስ	2024-08-19 00:00:00	Google Play Store	ትርሃስ	negative	0.6970565915107727	0	neutral	0	neutral
1109	1	Gio	2024-08-19 00:00:00	Google Play Store	gio	positive	0.9969680905342102	0	neutral	0	neutral
1110	1	App isn't working	2024-08-18 00:00:00	Google Play Store	app working	positive	0.9911891222000122	0	neutral	0	neutral
1111	1	Best app	2024-08-18 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
1112	1	so far good but always it lugs	2024-08-17 00:00:00	Google Play Store	far good always lug	positive	0.9997459053993225	0.4404	positive	0.39999999999999997	positive
1113	1	Don't trust this bank and its service.	2024-08-16 00:00:00	Google Play Store	trust bank service	positive	0.8190041184425354	0.5106	positive	0	neutral
1114	1	I can not open and use the application,please help me!	2024-08-15 00:00:00	Google Play Store	open use application please help	positive	0.9967190623283386	0.6124	positive	0	neutral
1115	1	Horrible	2024-08-14 00:00:00	Google Play Store	horrible	negative	0.9997841715812683	-0.5423	negative	-1	negative
1116	1	Mostly not working 😑	2024-08-14 00:00:00	Google Play Store	mostly working	positive	0.8939193487167358	0	neutral	0.5	positive
1117	1	Good	2024-08-13 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1118	1	Awesome 👌	2024-08-12 00:00:00	Google Play Store	awesome	positive	0.9998682737350464	0.6249	positive	1	positive
1119	1	Despite the enhanced technology you have, the application doesn't work properly, and it asks for the developer option to be turned off, fix that.	2024-08-12 00:00:00	Google Play Store	despite enhanced technology application work properly asks developer option turned fix	negative	0.997391939163208	0	neutral	0	neutral
1120	1	Thank you	2024-08-12 00:00:00	Google Play Store	thank	positive	0.9998283386230469	0.3612	positive	0	neutral
1121	1	Very poor app b/c highly slow to open the app	2024-08-12 00:00:00	Google Play Store	poor app highly slow open app	negative	0.999795138835907	-0.4767	negative	-0.23333333333333336	negative
1122	1	Ok	2024-08-12 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1123	1	best	2024-08-12 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
1124	1	Best app	2024-08-11 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
1125	1	Wedi Tekle .	2024-08-11 00:00:00	Google Play Store	wedi tekle	negative	0.6245816946029663	0	neutral	0	neutral
1126	1	Bad app📱👎👎👎	2024-08-11 00:00:00	Google Play Store	bad	negative	0.999782383441925	-0.5423	negative	-0.6999999999999998	negative
1127	1	Dura nan fayyadaman ture amma garuu naaf hojjechaa hin jiru maaf?	2024-08-11 00:00:00	Google Play Store	dura nan fayyadaman ture amma garuu naaf hojjechaa hin jiru maaf	negative	0.991762638092041	0	neutral	0	neutral
1128	1	Nice appp	2024-08-11 00:00:00	Google Play Store	nice appp	positive	0.9997910857200623	0.4215	positive	0.6	positive
1159	1	This app has become the most troubling every day. It doesn't work. I love the bank, and I hate the app	2024-07-31 00:00:00	Google Play Store	app become troubling every day work love bank hate app	negative	0.9992349147796631	-0.4588	negative	-0.15000000000000002	negative
1129	1	ሰላም አቢሲኒያዎች የሞባይል ባንኪንጋችሁ ተጠቃሚ ነኝ አገልግሎቱን ስላስጀመራችሁለን እናመሰግናለን። ነገር ግን አለፎ አልፎ የነበረው የማስፈንጠሪያው በአግባቡ አለመስራት አልፎ አልፎ ወደመስራት ተቀይሯል ድሮ እንደነበራችሁ እናውቃለን ዘንድሮም ብትኖሩልን እንመርጣለን *ከዘመን አንጉደል*	2024-08-10 00:00:00	Google Play Store	ሰላም አቢሲኒያዎች የሞባይል ባንኪንጋችሁ ተጠቃሚ ነኝ አገልግሎቱን ስላስጀመራችሁለን ነገር ግን አለፎ አልፎ የነበረው የማስፈንጠሪያው በአግባቡ አለመስራት አልፎ አልፎ ወደመስራት ተቀይሯል ድሮ እንደነበራችሁ እናውቃለን ዘንድሮም ብትኖሩልን እንመርጣለን ከዘመን አንጉደል	negative	0.961666464805603	0	neutral	0	neutral
1130	1	Gooood app my dear	2024-08-10 00:00:00	Google Play Store	gooood app dear	negative	0.9270796775817871	0.3818	positive	0	neutral
1131	1	Harun tamam galanaa	2024-08-09 00:00:00	Google Play Store	harun tamam galanaa	negative	0.9410594701766968	0	neutral	0	neutral
1132	1	A total disaster of an app. Always offline, never works, it's embarassing. I've lost hope and taken my business to a competitor	2024-08-08 00:00:00	Google Play Store	total disaster app always offline never work embarassing lost hope taken business competitor	negative	0.9994229078292847	-0.1872	negative	0	neutral
1133	1	Gamebela	2024-08-08 00:00:00	Google Play Store	gamebela	positive	0.8994184732437134	0	neutral	0	neutral
1134	1	so poor app to use can't start up when open the app	2024-08-08 00:00:00	Google Play Store	poor app use ca start open app	negative	0.9997187256813049	-0.4767	negative	-0.2	negative
1135	1	This app takes too long time to be opened. And even it is not working simply as other banks application. Why this app does not give a digital invoice. Even, I am not able to find where the screeshot is kept after transaction. So, please the developer should fix all these.	2024-08-07 00:00:00	Google Play Store	app take long time opened even working simply bank application app give digital invoice even able find screeshot kept transaction please developer fix	negative	0.990401566028595	0.3182	positive	0.1125	positive
1136	1	Good job	2024-08-07 00:00:00	Google Play Store	good job	positive	0.999835729598999	0.4404	positive	0.7	positive
1137	1	Worst app ever, not user friendly, even doesn't serve basic functionality correctly, takes to much time to login and navigate through the app, we expected more from this bank	2024-08-07 00:00:00	Google Play Store	worst app ever user friendly even serve basic functionality correctly take much time login navigate app expected bank	negative	0.999792754650116	-0.2263	negative	-0.10500000000000001	negative
1138	1	good	2024-08-07 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1139	1	Good	2024-08-07 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1140	1	Bad app .	2024-08-06 00:00:00	Google Play Store	bad app	negative	0.9997212290763855	-0.5423	negative	-0.6999999999999998	negative
1141	1	I mean how could a big financial company like this, be this much irresponsible to release this app? You should be ashamed!	2024-08-06 00:00:00	Google Play Store	mean could big financial company like much irresponsible release app ashamed	negative	0.9990673661231995	-0.5423	negative	-0.028124999999999997	neutral
1142	1	Review	2024-08-06 00:00:00	Google Play Store	review	positive	0.9946893453598022	0	neutral	0	neutral
1143	1	Goood	2024-08-06 00:00:00	Google Play Store	goood	negative	0.9943867921829224	0	neutral	0	neutral
1144	1	Ok	2024-08-06 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1145	1	👎👎👎👎👎👎👎👎👎	2024-08-06 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
1146	1	Is it necessary to switch off developer options every time to use mobile banking?🤔🤔😡😡😡	2024-08-04 00:00:00	Google Play Store	necessary switch developer option every time use mobile banking	negative	0.8661465644836426	0	neutral	0	neutral
1147	1	The previous version is better it doesn't work	2024-08-04 00:00:00	Google Play Store	previous version better work	positive	0.9890688061714172	0.4404	positive	0.16666666666666669	positive
1148	1	I don't know what is wrong with BOA as a bank in general. It's been going backwards since last year or so. The app is a disaster to use in every possible way. Not stable to log in and very slow to perform transactions, couldn't take a screenshot (or can't even find the pictures even using its save screenshot option). Most of the time, it fails to perform transactions and so on. Simply, it's the worst!	2024-08-03 00:00:00	Google Play Store	know wrong boa bank general going backwards since last year app disaster use every possible way stable log slow perform transaction could take screenshot ca even find picture even using save screenshot option time fails perform transaction simply worst	negative	0.9997175335884094	-0.8658	negative	-0.32142857142857145	negative
1149	1	ok	2024-08-03 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1150	1	Nice	2024-08-03 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
1151	1	Take some note from CBE mobile banking app, it's the best banking app currently take some note and improve ur app . Sometimes u have to learn from the bests 🙌	2024-08-03 00:00:00	Google Play Store	take note cbe mobile banking app best banking app currently take note improve ur app sometimes u learn best	positive	0.9746192097663879	0.9062	positive	0.6666666666666666	positive
1152	1	Great	2024-08-03 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
1153	1	It's a useless app	2024-08-02 00:00:00	Google Play Store	useless app	negative	0.9997797608375549	-0.4215	negative	-0.5	negative
1154	1	It's not working as it was , so much need to improve, it was the best but not anymore	2024-08-01 00:00:00	Google Play Store	working much need improve best anymore	negative	0.9919127225875854	0.7964	positive	0.6	positive
1155	1	Poor network	2024-08-01 00:00:00	Google Play Store	poor network	negative	0.9997891783714294	-0.4767	negative	-0.4	negative
1156	1	Not yet completely working this App. i don't know when is it will be working properly! Its Sad!!!	2024-07-31 00:00:00	Google Play Store	yet completely working app know working properly sad	negative	0.9863727688789368	-0.4767	negative	-0.2	negative
1157	1	The app does not open sometimes it says coonection issue which i dont have and after it opens it has bugs while using its not smooth to work with please improve it	2024-07-31 00:00:00	Google Play Store	app open sometimes say coonection issue dont open bug using smooth work please improve	negative	0.796912431716919	0.6369	positive	0.13333333333333333	positive
1158	1	It's not working totally, what a useless app is it,	2024-07-31 00:00:00	Google Play Store	working totally useless app	negative	0.9997736811637878	-0.4754	negative	-0.5	negative
1161	1	አቢስኒያ የሁሉም ምርጫ	2024-07-29 00:00:00	Google Play Store	አቢስኒያ የሁሉም ምርጫ	negative	0.8337252736091614	0	neutral	0	neutral
1162	1	Ok	2024-07-29 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
1163	1	Nays	2024-07-28 00:00:00	Google Play Store	nay	negative	0.996103048324585	0	neutral	0	neutral
1164	1	The worst app	2024-07-28 00:00:00	Google Play Store	worst app	negative	0.9997863173484802	-0.6249	negative	-1	negative
1165	1	it can't even open and only display error messages	2024-07-27 00:00:00	Google Play Store	ca even open display error message	negative	0.9912436008453369	-0.4019	negative	0	neutral
1166	1	not active	2024-07-27 00:00:00	Google Play Store	active	positive	0.9998134970664978	0.4019	positive	-0.13333333333333333	negative
1167	1	To get good quality	2024-07-27 00:00:00	Google Play Store	get good quality	positive	0.9998713731765747	0.4404	positive	0.7	positive
1168	1	አይሰራም እኮ ምንድን ነው ችግሩ?	2024-07-26 00:00:00	Google Play Store	አይሰራም እኮ ምንድን ነው ችግሩ	negative	0.8832131028175354	0	neutral	0	neutral
1169	1	uselss app dont download	2024-07-26 00:00:00	Google Play Store	uselss app dont download	negative	0.9977203011512756	0	neutral	0	neutral
1170	1	Is this app fake i try it not working it say please try again later, unable to make transactions what is the purpose of this app . If it is not working delete it	2024-07-25 00:00:00	Google Play Store	app fake try working say please try later unable make transaction purpose app working delete	negative	0.9993707537651062	-0.2023	negative	-0.3333333333333333	negative
1171	1	This app didn't work. They have a new version (new app) but still not compatible with my Samsung S8+ , which is v.funny.	2024-07-25 00:00:00	Google Play Store	app work new version new app still compatible samsung	positive	0.7038795351982117	0	neutral	0.13636363636363635	positive
1172	1	Corrupted and poor app	2024-07-24 00:00:00	Google Play Store	corrupted poor app	negative	0.9997506737709045	-0.4767	negative	-0.4	negative
1173	1	Good	2024-07-24 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
1174	1	When I try to use the application it says 'developer setting should be off' where is the setting to off this play Still doesn't work for me	2024-07-24 00:00:00	Google Play Store	try use application say setting setting play still work	negative	0.9879827499389648	0.34	positive	0	neutral
1175	1	Nice	2024-07-24 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
1176	1	FIX YOUR Apollo!! You guys where the best 👌	2024-07-23 00:00:00	Google Play Store	fix apollo guy best	positive	0.9726526737213135	0.6369	positive	1	positive
1177	1	Always slow and doesn't work on weekends if you are in a rush or a merchant this app is not for you	2024-07-23 00:00:00	Google Play Store	always slow work weekend rush merchant app	negative	0.9924728870391846	0	neutral	-0.30000000000000004	negative
1178	1	It's very difficult to use the user, app,ones dawenload the user can't operate well , no one can help me,	2024-07-23 00:00:00	Google Play Store	difficult use user app one dawenload user ca operate well one help	negative	0.9831226468086243	0.3182	positive	-0.5	negative
1179	1	Poor application. It turned off by itself	2024-07-23 00:00:00	Google Play Store	poor application turned	negative	0.9998024106025696	-0.4767	negative	-0.4	negative
1180	1	Okay	2024-07-23 00:00:00	Google Play Store	okay	positive	0.9997709393501282	0.2263	positive	0.5	positive
1181	1	Allowed	2024-07-23 00:00:00	Google Play Store	allowed	positive	0.9978752136230469	0	neutral	0	neutral
1182	1	It usually crashes and the reason it gives is a problem on internet connection although the internet was fine.	2024-07-23 00:00:00	Google Play Store	usually crash reason give problem internet connection although internet fine	negative	0.9911579489707947	-0.5574	negative	0.08333333333333334	positive
1183	1	we want international mobile banking	2024-07-22 00:00:00	Google Play Store	want international mobile banking	positive	0.94110506772995	0.0772	positive	0	neutral
1184	1	screenshot isn't working, Please modify it	2024-07-22 00:00:00	Google Play Store	screenshot working please modify	positive	0.7578237652778625	0.3182	positive	0	neutral
1185	1	Naziriet measho 89160437	2024-07-22 00:00:00	Google Play Store	naziriet measho 89160437	negative	0.9862651228904724	0	neutral	0	neutral
1186	1	Ahmed Mohammed husen	2024-07-21 00:00:00	Google Play Store	ahmed mohammed husen	positive	0.9124148488044739	0	neutral	0	neutral
1187	1	Is not working both this one and apollo did u make it better pls am gonne stop using this bank because of the mobile banking	2024-07-19 00:00:00	Google Play Store	working one apollo u make better pls gonne stop using bank mobile banking	negative	0.9991903901100159	0.25	positive	0.5	positive
1188	1	I have experiance	2024-07-19 00:00:00	Google Play Store	experiance	positive	0.5539519786834717	0	neutral	0	neutral
1189	1	The App is not working on Android 9.1 at all. It shows an error notification and forcefully closes the app. Must be fixed ASAP.	2024-07-19 00:00:00	Google Play Store	app working android show error notification forcefully close app must fixed asap	negative	0.9993361830711365	-0.4019	negative	0.1	positive
1190	1	Wow	2024-07-19 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
1191	1	Crashes very frequently is not stable overall need improvement such a huge bank needs a better app than the current one	2024-07-19 00:00:00	Google Play Store	crash frequently stable overall need improvement huge bank need better app current one	negative	0.9623240828514099	0.7717	positive	0.2	positive
1192	1	ርይርፍ	2024-07-19 00:00:00	Google Play Store	ርይርፍ	negative	0.6970565915107727	0	neutral	0	neutral
1193	1	The previous application is much better than this one	2024-07-18 00:00:00	Google Play Store	previous application much better one	positive	0.9920862317085266	0.4404	positive	0.16666666666666669	positive
1194	1	Worst app. It is wise to invest money and you can make it like CBE app. Even the incon has no image. My app has better UI than yours. So, please invest more and hire professional developer companies and improve it.	2024-07-18 00:00:00	Google Play Store	worst app wise invest money make like cbe app even incon image app better ui please invest hire professional developer company improve	negative	0.9996022582054138	0.8225	positive	0.07499999999999998	positive
1195	1	mal	2024-07-16 00:00:00	Google Play Store	mal	negative	0.9996137022972107	0	neutral	0	neutral
1196	1	It is not working at all	2024-07-16 00:00:00	Google Play Store	working	positive	0.9987824559211731	0	neutral	0	neutral
1197	1	Excellent	2024-07-16 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
1198	1	The poorest mobile banking survice ever. Only error reports frequently	2024-07-16 00:00:00	Google Play Store	poorest mobile banking survice ever error report frequently	negative	0.9995482563972473	-0.7351	negative	0.1	positive
1199	1	Wow	2024-07-16 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
1200	1	😞😞😞😞	2024-07-16 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2099	2	ይህ መተግበሪያ በጣም ጥሩ ነው. this app is very nice	2025-05-22 00:00:00	Google Play Store	ይህ መተግበሪያ በጣም ጥሩ ነው app nice	positive	0.9866936802864075	0.4215	positive	0.6	positive
2100	2	I hate this app 😒	2025-05-22 00:00:00	Google Play Store	hate app	negative	0.9996696710586548	-0.5719	negative	-0.8	negative
2101	2	trustful	2025-05-22 00:00:00	Google Play Store	trustful	positive	0.9998213648796082	0.4767	positive	0	neutral
2102	2	I like	2025-05-22 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2103	2	update issue	2025-05-22 00:00:00	Google Play Store	update issue	positive	0.5473260283470154	0	neutral	0	neutral
2104	2	its not working over safari network	2025-05-22 00:00:00	Google Play Store	working safari network	positive	0.8978400826454163	0	neutral	0	neutral
2105	2	oldie	2025-05-22 00:00:00	Google Play Store	oldie	negative	0.6663177013397217	0	neutral	0	neutral
2106	2	it doesn't work	2025-05-21 00:00:00	Google Play Store	work	positive	0.9994449019432068	0	neutral	0	neutral
2107	2	best	2025-05-21 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2108	2	This app is good, and we are using it well	2025-05-21 00:00:00	Google Play Store	app good using well	positive	0.9997630715370178	0.6124	positive	0.7	positive
2109	2	ok	2025-05-21 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2110	2	best app	2025-05-21 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2111	2	best	2025-05-21 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2112	2	very nice 👌 app for android phone	2025-05-21 00:00:00	Google Play Store	nice app android phone	positive	0.9996562004089355	0.4215	positive	0.6	positive
2113	2	good app	2025-05-21 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2114	2	Yes Yes	2025-05-21 00:00:00	Google Play Store	yes yes	positive	0.9997482895851135	0.6597	positive	0	neutral
2115	2	በጣም ከርፋፋ	2025-05-21 00:00:00	Google Play Store	በጣም ከርፋፋ	negative	0.7850590348243713	0	neutral	0	neutral
2116	2	easy to use helpful in my life	2025-05-21 00:00:00	Google Play Store	easy use helpful life	positive	0.9875379800796509	0.6908	positive	0.43333333333333335	positive
2117	2	good 👍	2025-05-21 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2118	2	the best mobile banking app	2025-05-21 00:00:00	Google Play Store	best mobile banking app	positive	0.9997095465660095	0.6369	positive	1	positive
2119	2	this app is very useful app,it saves time,and it is secure	2025-05-21 00:00:00	Google Play Store	app useful app save time secure	positive	0.9361007213592529	0.8176	positive	0.35	positive
2120	2	ok	2025-05-21 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2121	2	it's a good application 👍	2025-05-21 00:00:00	Google Play Store	good application	positive	0.999854564666748	0.4404	positive	0.7	positive
2122	2	the screenshot and the reffresh options are so annoying that makes transaction so delaying activity !	2025-05-21 00:00:00	Google Play Store	screenshot reffresh option annoying make transaction delaying activity	negative	0.9992175102233887	-0.4019	negative	-0.8	negative
2123	2	poor service	2025-05-21 00:00:00	Google Play Store	poor service	negative	0.9996534585952759	-0.4767	negative	-0.4	negative
2124	2	amazing	2025-05-20 00:00:00	Google Play Store	amazing	positive	0.999875545501709	0.5859	positive	0.6000000000000001	positive
2125	2	it is reliable and easy to use.	2025-05-20 00:00:00	Google Play Store	reliable easy use	positive	0.9996548891067505	0.4404	positive	0.43333333333333335	positive
2126	2	the most annoying mobile banking app I've ever seen	2025-05-20 00:00:00	Google Play Store	annoying mobile banking app ever seen	negative	0.9996514320373535	-0.4019	negative	-0.8	negative
2127	2	Cbe mobile banking	2025-05-20 00:00:00	Google Play Store	cbe mobile banking	positive	0.8304281234741211	0	neutral	0	neutral
2128	2	i can't make Screenshout in this app, please made modification	2025-05-20 00:00:00	Google Play Store	ca make screenshout app please made modification	negative	0.9518901109695435	0.3182	positive	0	neutral
2129	2	Best app I loved it	2025-05-19 00:00:00	Google Play Store	best app loved	positive	0.999723494052887	0.8442	positive	0.85	positive
2130	2	nice app	2025-05-19 00:00:00	Google Play Store	nice app	positive	0.9998061060905457	0.4215	positive	0.6	positive
2131	2	wow	2025-05-18 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
2132	2	Amazing applicatiom sometimes doesnt work!	2025-05-18 00:00:00	Google Play Store	amazing applicatiom sometimes doesnt work	negative	0.970992922782898	0.5859	positive	0.6000000000000001	positive
2133	2	well satisfied with this beautiful app	2025-05-18 00:00:00	Google Play Store	well satisfied beautiful app	positive	0.999863862991333	0.8316	positive	0.675	positive
2134	2	very good	2025-05-17 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2135	2	best app.	2025-05-17 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2136	2	good	2025-05-17 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2137	2	not working,why???	2025-05-17 00:00:00	Google Play Store	working	positive	0.9987824559211731	0	neutral	0	neutral
2138	2	Great impact but why Developer option turnoff if you fix 🙏 🙏 🙏	2025-05-17 00:00:00	Google Play Store	great impact developer option turnoff fix	positive	0.9929900169372559	0.6249	positive	0.8	positive
2139	2	excellent	2025-05-17 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2140	2	always disappointing ! especially the iOS one !! some similar local applications are extremely superior to this application!! Really disappointing!	2025-05-17 00:00:00	Google Play Store	always disappointing especially io one similar local application extremely superior application really disappointing	negative	0.9997307658195496	-0.3832	negative	-0.08333333333333333	negative
2141	2	woxe harimo ribiso	2025-05-17 00:00:00	Google Play Store	woxe harimo ribiso	negative	0.9374371767044067	0	neutral	0	neutral
2142	2	good	2025-05-16 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2221	2	super	2025-04-26 00:00:00	Google Play Store	super	positive	0.998783528804779	0.5994	positive	0.3333333333333333	positive
2222	2	ጠጀጨገጀ።ጀገ	2025-04-26 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2223	2	i like the app	2025-04-26 00:00:00	Google Play Store	like app	positive	0.9840216040611267	0.3612	positive	0	neutral
2224	2	the Best	2025-04-26 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2225	2	nice	2025-04-26 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2226	2	good	2025-04-26 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2227	2	good	2025-04-25 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2228	2	to other bank is bad	2025-04-25 00:00:00	Google Play Store	bank bad	negative	0.9997609257698059	-0.5423	negative	-0.6999999999999998	negative
2229	2	tank's	2025-04-25 00:00:00	Google Play Store	tank	negative	0.9976772665977478	0	neutral	0	neutral
2230	2	its good but add more features such like. bank statement showing	2025-04-24 00:00:00	Google Play Store	good add feature like bank statement showing	positive	0.9995161294937134	0.6597	positive	0.7	positive
2231	2	it is so nice	2025-04-24 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2232	2	good	2025-04-21 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2233	2	Very Good👍	2025-04-21 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2234	2	my first frequent experience of cbe app is critical-time failure such as suspending payment on air for 2-5 days with zero explanation, deducting from sender account without depositing to the receiver act. Another fatal error by the banking company as a whole (not the app itself though) is forced-banking with corporations without consent of employers-users of the corresponding corporations	2025-04-21 00:00:00	Google Play Store	first frequent experience cbe app failure suspending payment air day zero explanation deducting sender account without depositing receiver act another fatal error banking company whole app though corporation without consent corresponding corporation	negative	0.9965302348136902	-0.8797	negative	0.058333333333333334	positive
2235	2	wow, amazing app	2025-04-21 00:00:00	Google Play Store	wow amazing app	positive	0.9998513460159302	0.8225	positive	0.35000000000000003	positive
2236	2	use ful	2025-04-21 00:00:00	Google Play Store	use ful	negative	0.9949980974197388	0	neutral	0	neutral
2237	2	Great app	2025-04-21 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
2238	2	well app	2025-04-20 00:00:00	Google Play Store	well app	positive	0.9993765950202942	0.2732	positive	0	neutral
2239	2	Actually it is inactive	2025-04-19 00:00:00	Google Play Store	actually inactive	negative	0.9996507167816162	0	neutral	0	neutral
2240	2	good	2025-04-19 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2241	2	ok	2025-04-19 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2242	2	best app	2025-04-19 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2243	2	amazing	2025-04-19 00:00:00	Google Play Store	amazing	positive	0.999875545501709	0.5859	positive	0.6000000000000001	positive
2244	2	good	2025-04-19 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2245	2	I like	2025-04-19 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2246	2	slow, only one account is used	2025-04-19 00:00:00	Google Play Store	slow one account used	negative	0.9996602535247803	0	neutral	-0.30000000000000004	negative
2247	2	ok	2025-04-19 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2248	2	always CBE is the leading Commercial Bank💪💪💪	2025-04-18 00:00:00	Google Play Store	always cbe leading commercial	positive	0.9988877177238464	0	neutral	0	neutral
2249	2	i like it	2025-04-18 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2250	2	why removing screenshot feature why?	2025-04-18 00:00:00	Google Play Store	removing screenshot feature	negative	0.9964273571968079	0	neutral	0	neutral
2251	2	nice apps where network is good in connection	2025-04-18 00:00:00	Google Play Store	nice apps network good connection	positive	0.9998291730880737	0.6908	positive	0.6499999999999999	positive
2252	2	Thank you!!!	2025-04-18 00:00:00	Google Play Store	thank	positive	0.9998283386230469	0.3612	positive	0	neutral
2253	2	i can't take screenshot	2025-04-18 00:00:00	Google Play Store	ca take screenshot	positive	0.9668144583702087	0	neutral	0	neutral
2254	2	every update was made the system better and better until the March 19th, 2025 update, not allowing us to screenshot. you guys didn't understand how much it's a really quick and significant thing. You add extra steps to us, which makes the process draw back	2025-04-18 00:00:00	Google Play Store	every update made system better better march 19th 2025 update allowing u screenshot guy understand much really quick significant thing add extra step u make process draw back	negative	0.9227718710899353	0.7832	positive	0.2847222222222222	positive
2255	2	perfectly special	2025-04-18 00:00:00	Google Play Store	perfectly special	positive	0.999879002571106	0.7845	positive	0.35714285714285715	positive
2256	2	Fast and Reliable	2025-04-18 00:00:00	Google Play Store	fast reliable	positive	0.9998382329940796	0	neutral	0.2	positive
2257	2	good	2025-04-17 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2258	2	The best application I have ever seen in Ethiopia banking industry.	2025-04-17 00:00:00	Google Play Store	best application ever seen ethiopia banking industry	positive	0.9993252754211426	0.6369	positive	1	positive
2259	2	great app!!!	2025-04-17 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
2260	2	because sometimes it doesn't working it load too much	2025-04-17 00:00:00	Google Play Store	sometimes working load much	negative	0.9713041186332703	0	neutral	0.2	positive
2261	2	Absolutely the best app! It works flawlessly, anytime and anywhere.	2025-04-17 00:00:00	Google Play Store	absolutely best app work flawlessly anytime anywhere	positive	0.9998094439506531	0.7425	positive	1	positive
2262	2	ok	2025-04-16 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2263	2	very nice app ever!!!	2025-04-16 00:00:00	Google Play Store	nice app ever	positive	0.9998384714126587	0.4215	positive	0.6	positive
2264	2	the best app	2025-04-16 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2265	2	Biometric security for mobile banking is not available	2025-04-16 00:00:00	Google Play Store	biometric security mobile banking available	positive	0.9248896837234497	0.34	positive	0.4	positive
2266	2	great	2025-04-15 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
2267	2	Nice service	2025-04-15 00:00:00	Google Play Store	nice service	positive	0.9998397827148438	0.4215	positive	0.6	positive
2268	2	great app	2025-04-15 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
2269	2	it's special apps	2025-04-15 00:00:00	Google Play Store	special apps	positive	0.997664213180542	0.4019	positive	0.35714285714285715	positive
2270	2	In the updated version of the app, it takes more time to download the receipt.	2025-04-15 00:00:00	Google Play Store	updated version app take time download receipt	positive	0.5578057765960693	0	neutral	0	neutral
2271	2	ለምንድነው ትራንዛክሽን ትንሽ ብቻ የሚያሳየው ?	2025-04-14 00:00:00	Google Play Store	ለምንድነው ትራንዛክሽን ትንሽ ብቻ የሚያሳየው	negative	0.8832131028175354	0	neutral	0	neutral
2272	2	Good 🔥	2025-04-14 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2273	2	very interesting app i am using every day fantastic	2025-04-14 00:00:00	Google Play Store	interesting app using every day fantastic	positive	0.9998313188552856	0.743	positive	0.45	positive
2274	2	lebaa bank	2025-04-14 00:00:00	Google Play Store	lebaa bank	negative	0.9437296390533447	0	neutral	0	neutral
2275	2	Can't scan/recognize other banks' Interoperable QR Codes	2025-04-13 00:00:00	Google Play Store	ca bank interoperable qr code	negative	0.9838408827781677	0	neutral	0	neutral
2276	2	OK	2025-04-13 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2277	2	grateful app	2025-04-13 00:00:00	Google Play Store	grateful app	positive	0.9998038411140442	0.4588	positive	0	neutral
2278	2	100% ❤️❤️❤️🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏	2025-04-13 00:00:00	Google Play Store	100	positive	0.9976649284362793	0	neutral	0	neutral
2279	2	everthing wellbeok	2025-04-13 00:00:00	Google Play Store	everthing wellbeok	negative	0.7055779695510864	0	neutral	0	neutral
2280	2	"This mobile banking app is fast and user-friendly, but the only issue I encountered is that I can't access my bank statement within the app. I kindly request that this feature be added, similar to what is offered by other private bank mobile banking apps.	2025-04-13 00:00:00	Google Play Store	mobile banking app fast issue encountered ca access bank statement within app kindly request feature added similar offered private bank mobile banking apps	negative	0.9769997596740723	0.4939	positive	0.2	positive
2281	2	nice app 👌	2025-04-12 00:00:00	Google Play Store	nice app	positive	0.9998061060905457	0.4215	positive	0.6	positive
2282	2	why did this app is not screenshot	2025-04-12 00:00:00	Google Play Store	app screenshot	positive	0.9535915851593018	0	neutral	0	neutral
2283	2	it so good app	2025-04-12 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2284	2	the best app	2025-04-12 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2285	2	جميل	2025-04-11 00:00:00	Google Play Store	جميل	positive	0.9271727204322815	0	neutral	0	neutral
2286	2	less network, specially to make fee for utility purpose	2025-04-11 00:00:00	Google Play Store	less network specially make fee utility purpose	negative	0.9902448654174805	0	neutral	0.09523809523809525	positive
2287	2	nice	2025-04-11 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2288	2	simply for used	2025-04-11 00:00:00	Google Play Store	simply used	positive	0.9404972195625305	0	neutral	0	neutral
2289	2	wow keep up	2025-04-10 00:00:00	Google Play Store	wow keep	positive	0.9997326731681824	0.5859	positive	0.1	positive
2290	2	its great app but when updating we can't take screen shot please try to fix it	2025-04-10 00:00:00	Google Play Store	great app updating ca take screen shot please try fix	positive	0.9972735047340393	0.7506	positive	0.8	positive
2291	2	good one	2025-04-10 00:00:00	Google Play Store	good one	positive	0.9998288154602051	0.4404	positive	0.7	positive
2292	2	best app.	2025-04-10 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2293	2	everything is easy thank you cebe	2025-04-10 00:00:00	Google Play Store	everything easy thank cebe	positive	0.9998242259025574	0.6597	positive	0.43333333333333335	positive
2294	2	ፈጣን ቀልጣፋ	2025-04-10 00:00:00	Google Play Store	ፈጣን ቀልጣፋ	negative	0.7850590348243713	0	neutral	0	neutral
2295	2	good	2025-04-10 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2296	2	ok	2025-04-10 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2297	2	ጎበዝ	2025-04-09 00:00:00	Google Play Store	ጎበዝ	negative	0.6970565915107727	0	neutral	0	neutral
2298	2	good app	2025-04-09 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2299	2	but this app says can't sync	2025-04-09 00:00:00	Google Play Store	app say ca sync	negative	0.9373792409896851	0	neutral	0	neutral
2300	2	waw	2025-04-09 00:00:00	Google Play Store	waw	negative	0.7346178889274597	0	neutral	0	neutral
2301	2	to slow	2025-04-09 00:00:00	Google Play Store	slow	negative	0.9997313618659973	0	neutral	-0.30000000000000004	negative
2302	2	work on screen shot system	2025-04-08 00:00:00	Google Play Store	work screen shot system	negative	0.6322099566459656	0	neutral	0	neutral
2303	2	very very nice aplication	2025-04-08 00:00:00	Google Play Store	nice aplication	positive	0.9995850920677185	0.4215	positive	0.6	positive
2304	2	Good	2025-04-08 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2305	2	wonder full and it is easy to use	2025-04-08 00:00:00	Google Play Store	wonder full easy use	positive	0.9983953833580017	0.4404	positive	0.39166666666666666	positive
2306	2	easy and reliable	2025-04-08 00:00:00	Google Play Store	easy reliable	positive	0.9998021721839905	0.4404	positive	0.43333333333333335	positive
2307	2	good	2025-04-08 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2308	2	it is Very Useful app 👍	2025-04-07 00:00:00	Google Play Store	useful app	positive	0.9991915822029114	0.4404	positive	0.3	positive
2309	2	very good	2025-04-07 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2310	2	perfect app	2025-04-07 00:00:00	Google Play Store	perfect app	positive	0.9998340606689453	0.5719	positive	1	positive
2311	2	I like it.	2025-04-07 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2312	2	bugs	2025-04-07 00:00:00	Google Play Store	bug	negative	0.9996434450149536	0	neutral	0	neutral
2313	2	commerial Bank	2025-04-06 00:00:00	Google Play Store	commerial bank	negative	0.6810258030891418	0	neutral	0	neutral
2314	2	Genat biru	2025-04-06 00:00:00	Google Play Store	genat biru	negative	0.966159999370575	0	neutral	0	neutral
2315	2	🙏	2025-04-06 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2316	2	it is good but it doesn't allow screen shot	2025-04-06 00:00:00	Google Play Store	good allow screen shot	positive	0.9998487234115601	0.5859	positive	0.7	positive
2317	2	the best one	2025-04-06 00:00:00	Google Play Store	best one	positive	0.999826967716217	0.6369	positive	1	positive
2318	2	You need to copy many things from other bank apps like Amole(Dashen)	2025-04-06 00:00:00	Google Play Store	need copy many thing bank apps like amole dashen	negative	0.9868232011795044	0.3612	positive	0.5	positive
2319	2	bring back the screenshot feature.	2025-04-05 00:00:00	Google Play Store	bring back screenshot feature	positive	0.9967185854911804	0	neutral	0	neutral
2320	2	Good!👍	2025-04-05 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2321	2	best app to experience him that to smooth transaction among the customers	2025-04-05 00:00:00	Google Play Store	best app experience smooth transaction among customer	positive	0.9990830421447754	0.6369	positive	0.7	positive
2322	2	good	2025-04-05 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2323	2	nice app suitable to use it. the only weak side is it need data connections and hoping will be fixed to offline i gave 4 rate	2025-04-05 00:00:00	Google Play Store	nice app suitable use weak side need data connection hoping fixed offline gave 4 rate	negative	0.902336835861206	0.296	positive	0.21874999999999997	positive
2324	2	easy to use	2025-04-05 00:00:00	Google Play Store	easy use	positive	0.9884273409843445	0.4404	positive	0.43333333333333335	positive
2325	2	Good job to the CBE team on this mobile app! It's designed in a way that's simple and intuitive to navigate, which is great for everyone. It effectively handles the essential banking tasks I need to perform regularly. It's a practical and reliable tool that makes everyday banking much more convenient. Thank you for this useful application.	2025-04-04 00:00:00	Google Play Store	good job cbe team mobile app designed way simple intuitive navigate great everyone effectively handle essential banking task need perform regularly practical reliable tool make everyday banking much convenient thank useful application	positive	0.9968330264091492	0.936	positive	0.26666666666666666	positive
2326	2	ለኔ በጣም ምርጥ ነው ግን screenshot ማረግ ቢቻል ምርጥ ነበር	2025-04-04 00:00:00	Google Play Store	ለኔ በጣም ምርጥ ነው ግን screenshot ማረግ ቢቻል ምርጥ ነበር	negative	0.881923258304596	0	neutral	0	neutral
2327	2	before it was smooth and good. this time after the new update in 2025 i can not make screenshot of my recite. even the downlod button is very delayed in putting my recite in my gallery for simple proof. please fix this i am unable to show proof of payment to my clients. thankyou.	2025-04-04 00:00:00	Google Play Store	smooth good time new update 2025 make screenshot recite even downlod button delayed putting recite gallery simple proof please fix unable show proof payment client thankyou	positive	0.9806323647499084	0.5106	positive	0.14727272727272728	positive
2328	2	cool ❤	2025-04-04 00:00:00	Google Play Store	cool	positive	0.9998509883880615	0.3182	positive	0.35	positive
2329	2	Best app	2025-04-04 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2330	2	great app	2025-04-03 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
2331	2	best banking App	2025-04-03 00:00:00	Google Play Store	best banking app	positive	0.999736487865448	0.6369	positive	1	positive
2332	2	satisfied	2025-04-03 00:00:00	Google Play Store	satisfied	positive	0.9997212290763855	0.4215	positive	0.5	positive
2333	2	this app is very necessary app many people found it	2025-04-03 00:00:00	Google Play Store	app necessary app many people found	positive	0.9250544905662537	0	neutral	0.25	positive
2334	2	cbe very active Bank I'm using CBE app very very satisfaction	2025-04-03 00:00:00	Google Play Store	cbe active bank using cbe app satisfaction	negative	0.8013827204704285	0.6808	positive	-0.13333333333333333	negative
2335	2	It made life alot easier. I cant even imagine having to make all those transactions in person. So this app was crucial for me. Very good app. well done.	2025-04-03 00:00:00	Google Play Store	made life alot easier cant even imagine make transaction person app crucial good app well done	positive	0.9950655102729797	0.7783	positive	0.35	positive
2336	2	excellent	2025-04-03 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2337	2	perfect	2025-04-03 00:00:00	Google Play Store	perfect	positive	0.9998517036437988	0.5719	positive	1	positive
2338	2	thankyou	2025-04-02 00:00:00	Google Play Store	thankyou	positive	0.9998428821563721	0	neutral	0	neutral
2339	2	I Like it	2025-04-02 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2340	2	ok	2025-04-02 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
2341	2	I don't understand the reason, why I need to disable developer options to access the app, it has no security risks nor does it hinder the app's functionalities. This goes out to the dev, I hope your life is filled with inconveniences.	2025-04-02 00:00:00	Google Play Store	understand reason need disable developer option access app security risk hinder app functionality go dev hope life filled inconvenience	negative	0.9988983869552612	0.1779	positive	0.4	positive
2342	2	smart app	2025-04-02 00:00:00	Google Play Store	smart app	positive	0.999789297580719	0.4019	positive	0.21428571428571427	positive
2343	2	isin ga'a	2025-04-02 00:00:00	Google Play Store	isin ga	positive	0.9746941924095154	0	neutral	0	neutral
2344	2	easy to use	2025-04-02 00:00:00	Google Play Store	easy use	positive	0.9884273409843445	0.4404	positive	0.43333333333333335	positive
2345	2	it's great	2025-04-02 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
2346	2	very good app and stars faction with work	2025-04-02 00:00:00	Google Play Store	good app star faction work	positive	0.9997707009315491	0.4404	positive	0.7	positive
2347	2	It is excelent	2025-04-01 00:00:00	Google Play Store	excelent	positive	0.9998672008514404	0	neutral	0	neutral
2348	2	Smart	2025-04-01 00:00:00	Google Play Store	smart	positive	0.9998456239700317	0.4019	positive	0.21428571428571427	positive
2349	2	በየወሩ አፕደት እየጠየቀኝ ነው ለነገሩ ብር ስሌለኝ ይሆናል እና ምን ለማለት ፈልገ መሰላቹ ወላህ ቼግሮኛል 🥺🥺🥺	2025-04-01 00:00:00	Google Play Store	በየወሩ አፕደት እየጠየቀኝ ነው ለነገሩ ብር ስሌለኝ ይሆናል እና ምን ለማለት ፈልገ መሰላቹ ወላህ ቼግሮኛል	negative	0.9558283686637878	0	neutral	0	neutral
2350	2	very interesting app	2025-04-01 00:00:00	Google Play Store	interesting app	positive	0.9996960163116455	0.4019	positive	0.5	positive
2351	2	i like it	2025-04-01 00:00:00	Google Play Store	like	positive	0.9910564422607422	0.3612	positive	0	neutral
2352	2	wow.......cbe.....keep it up.....!!!!!!	2025-04-01 00:00:00	Google Play Store	wow cbe keep	positive	0.9987928867340088	0.5859	positive	0.1	positive
2353	2	ጊዜን ቆጣቢ እና ህይወትን ቀለል ከሚያደርጉ ኢትዬጲያ ካሉ ፋይናንስ አፕልኬሽኖች ሁሉ ይሄ ይለያል	2025-04-01 00:00:00	Google Play Store	ጊዜን ቆጣቢ እና ህይወትን ቀለል ከሚያደርጉ ኢትዬጲያ ካሉ ፋይናንስ አፕልኬሽኖች ሁሉ ይሄ ይለያል	negative	0.9510265588760376	0	neutral	0	neutral
2354	2	Excellent🙏app	2025-04-01 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
2355	2	the most useful	2025-04-01 00:00:00	Google Play Store	useful	positive	0.9997634291648865	0.4404	positive	0.3	positive
2356	2	I am more satisfied in this app . More sure you have to secure.	2025-04-01 00:00:00	Google Play Store	satisfied app sure secure	positive	0.9997169375419617	0.7579	positive	0.4666666666666666	positive
2357	2	Easy to use	2025-04-01 00:00:00	Google Play Store	easy use	positive	0.9884273409843445	0.4404	positive	0.43333333333333335	positive
2358	2	very good, but sometimes NUR CBE comes without my consent. even if I choose locked, it appears	2025-04-01 00:00:00	Google Play Store	good sometimes nur cbe come without consent even choose locked appears	positive	0.5422942638397217	0.3036	positive	0.7	positive
2359	2	Excellent !!!	2025-04-01 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2360	2	always we relay on	2025-04-01 00:00:00	Google Play Store	always relay	positive	0.993179202079773	0	neutral	0	neutral
2361	2	I'm lucky to have this🙏 thank you CBE.	2025-04-01 00:00:00	Google Play Store	lucky thank cbe	positive	0.9998283386230469	0.6486	positive	0.3333333333333333	positive
2362	2	it's need more improvement like Tellbirr.	2025-04-01 00:00:00	Google Play Store	need improvement like tellbirr	negative	0.9934640526771545	0.6705	positive	0	neutral
2363	2	goode app	2025-04-01 00:00:00	Google Play Store	goode app	positive	0.9997406601905823	0	neutral	0	neutral
2364	2	a very nice app.👍👍👍	2025-04-01 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2365	2	safe easy & fast	2025-04-01 00:00:00	Google Play Store	safe easy fast	positive	0.9993506073951721	0.7003	positive	0.37777777777777777	positive
2366	2	perfect	2025-04-01 00:00:00	Google Play Store	perfect	positive	0.9998517036437988	0.5719	positive	1	positive
2367	2	it's good app	2025-04-01 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2368	2	nice	2025-04-01 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2369	2	good app	2025-04-01 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
2370	2	It is veary useful app but screen shout was impossible .solve this problem	2025-04-01 00:00:00	Google Play Store	veary useful app screen shout impossible problem	negative	0.9930961728096008	0.0516	positive	-0.18333333333333332	negative
2371	2	ጥሩ ነው	2025-04-01 00:00:00	Google Play Store	ጥሩ ነው	negative	0.7850590348243713	0	neutral	0	neutral
2372	2	እጅግ በጣም ጥሩ አፕ	2025-04-01 00:00:00	Google Play Store	እጅግ በጣም ጥሩ አፕ	negative	0.8616330027580261	0	neutral	0	neutral
2373	2	good	2025-04-01 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2374	2	በጣም ሃሪፍ ነው ግን ብር በሚተላለፍበት ወቅት ተቀንሷል ይላል እላፊ መልክቱ ይደርሳል ግን አይቀንስም	2025-04-01 00:00:00	Google Play Store	በጣም ሃሪፍ ነው ግን ብር በሚተላለፍበት ወቅት ተቀንሷል ይላል እላፊ መልክቱ ይደርሳል ግን አይቀንስም	negative	0.9528433680534363	0	neutral	0	neutral
2375	2	suitable app	2025-04-01 00:00:00	Google Play Store	suitable app	positive	0.9997665286064148	0	neutral	0.55	positive
2376	2	Dear cbe this app is not comparable with 21century and pls try to solve it.💀💀💀	2025-04-01 00:00:00	Google Play Store	dear cbe app comparable 21century pls try solve	negative	0.9526162147521973	0.5719	positive	0	neutral
2377	2	Good	2025-04-01 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2378	2	nice app	2025-04-01 00:00:00	Google Play Store	nice app	positive	0.9998061060905457	0.4215	positive	0.6	positive
2379	2	best transaction method of financial	2025-04-01 00:00:00	Google Play Store	best transaction method financial	positive	0.999427080154419	0.6369	positive	0.5	positive
2380	2	#CBE is Now going to on the right Pathway/track/!! Thank you CBE one step ahead on payment platform app!!	2025-04-01 00:00:00	Google Play Store	cbe going right thank cbe one step ahead payment platform app	positive	0.9996165037155151	0.3612	positive	0.2857142857142857	positive
2381	2	It literarily don't work at all	2025-04-01 00:00:00	Google Play Store	literarily work	positive	0.9991438388824463	0	neutral	0.1	positive
2382	2	good give us plus	2025-04-01 00:00:00	Google Play Store	good give u plus	positive	0.999869704246521	0.4404	positive	0.7	positive
2383	2	Very good application. However, I have one functionality recommendation. What if you let the app transfer money to any telebirr account as for MPESA? By the way, I am not the only one to ask this. Thank you!	2025-04-01 00:00:00	Google Play Store	good application however one functionality recommendation let app transfer money telebirr account mpesa way one ask thank	positive	0.9487853646278381	0.6597	positive	0.7	positive
2384	2	before update it was able to screenshot while after update I can't able to screenshot the transfere details	2025-04-01 00:00:00	Google Play Store	update able screenshot update ca able screenshot transfere detail	positive	0.9668794870376587	0	neutral	0.5	positive
2385	2	Tnc Cbe	2025-04-01 00:00:00	Google Play Store	tnc cbe	positive	0.9070308804512024	0	neutral	0	neutral
2386	2	it is good app. But you have integrate cbe with cbe birr. to allow cardless withdrawal directly from our accout!	2025-03-31 00:00:00	Google Play Store	good app integrate cbe cbe birr allow cardless withdrawal directly accout	positive	0.95685213804245	0.5994	positive	0.39999999999999997	positive
2387	2	great apps	2025-03-31 00:00:00	Google Play Store	great apps	positive	0.9998534917831421	0.6249	positive	0.8	positive
2388	2	Excellent	2025-03-31 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
2389	2	Great app!	2025-03-31 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
2390	2	nice	2025-03-31 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
2391	2	CBE	2025-03-31 00:00:00	Google Play Store	cbe	positive	0.9966009855270386	0	neutral	0	neutral
2392	2	very good 👍 👏	2025-03-31 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2393	2	great when it works	2025-03-31 00:00:00	Google Play Store	great work	positive	0.9998679161071777	0.6249	positive	0.8	positive
2394	2	the app is very good, but why screenshots is impossible?	2025-03-31 00:00:00	Google Play Store	app good screenshots impossible	positive	0.9857288599014282	0.4404	positive	0.016666666666666663	neutral
2395	2	excellent match application	2025-03-31 00:00:00	Google Play Store	excellent match application	positive	0.9998453855514526	0.5719	positive	1	positive
2396	2	very good	2025-03-31 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
2397	2	best app	2025-03-31 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
2398	2	The Best app😍😍😍	2025-03-31 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
2399	2	excellent app	2025-03-31 00:00:00	Google Play Store	excellent app	positive	0.9998356103897095	0.5719	positive	1	positive
2400	2	easy to use and user friendly	2025-03-31 00:00:00	Google Play Store	easy use user friendly	positive	0.9000470042228699	0.7269	positive	0.4041666666666667	positive
3279	3	great app	2025-04-30 00:00:00	Google Play Store	great app	positive	0.999821126461029	0.6249	positive	0.8	positive
3239	3	The best app ever in finance sector	2025-05-18 00:00:00	Google Play Store	best app ever finance sector	positive	0.9996483325958252	0.6369	positive	1	positive
3240	3	Its good app than other compitators but it confuse when we transfer it needs OTP and PIN most user inter their pin instead of OTP we know the litrecy level of our society so if it is device based i dont know the needs of OTP so please try to fix	2025-05-18 00:00:00	Google Play Store	good app compitators confuse transfer need otp pin user inter pin instead otp know litrecy level society device based dont know need otp please try fix	negative	0.7498508095741272	0.5106	positive	0.7	positive
3241	3	dashen bank or dashen super app?	2025-05-17 00:00:00	Google Play Store	dashen bank dashen super app	negative	0.5405244827270508	0.5994	positive	0.3333333333333333	positive
3242	3	wowwwe app	2025-05-17 00:00:00	Google Play Store	wowwwe app	positive	0.9829692840576172	0	neutral	0	neutral
3243	3	Transferring to other bank accounts is a hastle and inconvenient .Get used to seeing " please try again "	2025-05-17 00:00:00	Google Play Store	transferring bank account hastle inconvenient used seeing please try	negative	0.9970412850379944	-0.0258	neutral	-0.6	negative
3244	3	good	2025-05-16 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3245	3	always lagging	2025-05-16 00:00:00	Google Play Store	always lagging	negative	0.9998013377189636	-0.2732	negative	0	neutral
3246	3	Amazing Application...	2025-05-16 00:00:00	Google Play Store	amazing application	positive	0.9998698234558105	0.5859	positive	0.6000000000000001	positive
3247	3	Fantastic	2025-05-16 00:00:00	Google Play Store	fantastic	positive	0.9998743534088135	0.5574	positive	0.4	positive
3248	3	Dashen bank app is very good, but sometimes it is not working well	2025-05-15 00:00:00	Google Play Store	dashen bank app good sometimes working well	positive	0.9990540146827698	0.6124	positive	0.7	positive
3249	3	its my choice	2025-05-15 00:00:00	Google Play Store	choice	positive	0.9985694885253906	0	neutral	0	neutral
3250	3	wow apo	2025-05-15 00:00:00	Google Play Store	wow apo	positive	0.9994785189628601	0.5859	positive	0.1	positive
3251	3	awesome app keep going	2025-05-14 00:00:00	Google Play Store	awesome app keep going	positive	0.9998502731323242	0.6249	positive	1	positive
3252	3	wow	2025-05-14 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3253	3	👍	2025-05-14 00:00:00	Google Play Store		positive	0.7481209635734558	0	neutral	0	neutral
3254	3	It grows ethiopian digital banking step ahead.All fetures in one,simple fast and convince.	2025-05-14 00:00:00	Google Play Store	grows ethiopian digital banking step fetures one simple fast convince	positive	0.9717164039611816	0.25	positive	0.06666666666666667	positive
3255	3	Game changer	2025-05-13 00:00:00	Google Play Store	game changer	positive	0.9887570738792419	0	neutral	-0.4	negative
3256	3	Totally amazing	2025-05-13 00:00:00	Google Play Store	totally amazing	positive	0.9998782873153687	0.624	positive	0.6000000000000001	positive
3257	3	super 😎	2025-05-13 00:00:00	Google Play Store	super	positive	0.998783528804779	0.5994	positive	0.3333333333333333	positive
3258	3	what a helpful app!!!!	2025-05-13 00:00:00	Google Play Store	helpful app	positive	0.9995542168617249	0.4215	positive	0	neutral
3259	3	Good	2025-05-13 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3260	3	nice	2025-05-13 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3261	3	wow	2025-05-13 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3262	3	To be honest, best banking and lifestyle app in Ethiopia.	2025-05-12 00:00:00	Google Play Store	honest best banking lifestyle app ethiopia	positive	0.9996052384376526	0.8176	positive	0.8	positive
3263	3	fast	2025-05-12 00:00:00	Google Play Store	fast	positive	0.9989494681358337	0	neutral	0.2	positive
3264	3	A must have, seamless, all in one digital platform "DB Superapp"! Keep living your motto "Always one step ahead"	2025-05-12 00:00:00	Google Play Store	must seamless one digital platform db superapp keep living motto always one step ahead	positive	0.9956278800964355	0	neutral	0.05	neutral
3265	3	This App makes digital banking effortless and convenient. User-friendly interface, secure transactions, and excellent features for managing finances efficiently.	2025-05-10 00:00:00	Google Play Store	app make digital banking effortless convenient interface secure transaction excellent feature managing finance efficiently	positive	0.9694324135780334	0.8316	positive	0.4666666666666666	positive
3266	3	good	2025-05-09 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3267	3	Amazing app super easy to use and best design. loved it.	2025-05-09 00:00:00	Google Play Store	amazing app super easy use best design loved	positive	0.9996820688247681	0.9623	positive	0.6133333333333333	positive
3268	3	its the best ever	2025-05-09 00:00:00	Google Play Store	best ever	positive	0.999841570854187	0.6369	positive	1	positive
3269	3	nice	2025-05-08 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3270	3	excellent game changer App	2025-05-08 00:00:00	Google Play Store	excellent game changer app	positive	0.9998358488082886	0.5719	positive	0.3	positive
3271	3	I am highly excited by using this application and it is the most favorable as well as preferrable mobile app.	2025-05-03 00:00:00	Google Play Store	highly excited using application favorable well preferrable mobile app	positive	0.9988784193992615	0.7841	positive	0.375	positive
3272	3	it seems me logging out within minutes	2025-05-03 00:00:00	Google Play Store	seems logging within minute	negative	0.9239580631256104	0	neutral	0	neutral
3273	3	nice app especially GUI and I have got some error when you send within dashen bank the receipter is not get SMS notification	2025-05-03 00:00:00	Google Play Store	nice app especially gui got error send within dashen bank receipter get sm notification	negative	0.95440673828125	-0.0422	neutral	0.3	positive
3274	3	yes i want dashen super open	2025-05-02 00:00:00	Google Play Store	yes want dashen super open	positive	0.9973095655441284	0.7845	positive	0.16666666666666666	positive
3275	3	Best App	2025-05-02 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3276	3	faster than this version	2025-05-01 00:00:00	Google Play Store	faster version	positive	0.9985572695732117	0	neutral	0	neutral
3277	3	Best UI mobile banking app, props to design team	2025-04-30 00:00:00	Google Play Store	best ui mobile banking app prop design team	positive	0.9993069171905518	0.6369	positive	1	positive
3278	3	thank you	2025-04-30 00:00:00	Google Play Store	thank	positive	0.9998283386230469	0.3612	positive	0	neutral
3280	3	bad.	2025-04-30 00:00:00	Google Play Store	bad	negative	0.999782383441925	-0.5423	negative	-0.6999999999999998	negative
3281	3	Dashen bank always one step ahead	2025-04-30 00:00:00	Google Play Store	dashen bank always one step ahead	positive	0.9996015429496765	0	neutral	0	neutral
3282	3	dashen super app is secure band very easy	2025-04-29 00:00:00	Google Play Store	dashen super app secure band easy	positive	0.8955520987510681	0.8481	positive	0.3888888888888889	positive
3283	3	It is very fast and secured mobile banking app! I like this app!	2025-04-29 00:00:00	Google Play Store	fast secured mobile banking app like app	positive	0.9950631260871887	0.6369	positive	0.2	positive
3284	3	best app I have ever seen	2025-04-29 00:00:00	Google Play Store	best app ever seen	positive	0.9994105100631714	0.6369	positive	1	positive
3285	3	best of best	2025-04-29 00:00:00	Google Play Store	best best	positive	0.9998223185539246	0.8555	positive	1	positive
3286	3	waw	2025-04-28 00:00:00	Google Play Store	waw	negative	0.7346178889274597	0	neutral	0	neutral
3287	3	best app	2025-04-28 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3288	3	Its slow when i try to see the Recent Transaction and stucked	2025-04-28 00:00:00	Google Play Store	slow try see recent transaction stucked	negative	0.9987096786499023	0	neutral	-0.15000000000000002	negative
3289	3	wowslnwoooo wowwww amazing !!!!!!!!	2025-04-28 00:00:00	Google Play Store	wowslnwoooo wowwww amazing	positive	0.9997797608375549	0.5859	positive	0.6000000000000001	positive
3290	3	wow appl	2025-04-28 00:00:00	Google Play Store	wow appl	positive	0.9994691014289856	0.5859	positive	0.1	positive
3291	3	why do i have to change a pin number i use my finger print so dummy	2025-04-27 00:00:00	Google Play Store	change pin number use finger print dummy	negative	0.9972420930862427	0.0772	positive	0	neutral
3292	3	very nice	2025-04-26 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3293	3	great	2025-04-26 00:00:00	Google Play Store	great	positive	0.9998630285263062	0.6249	positive	0.8	positive
3294	3	It is very slow and it lacks many features to be a super app. High rating is given by their employees, not by the customers.	2025-04-25 00:00:00	Google Play Store	slow lack many feature super app high rating given employee customer	negative	0.9995512366294861	0.3818	positive	0.1733333333333333	positive
3295	3	Smooth and secure experience transfers, bill payments, and tracking expenses are all effortless. The intuitive design makes banking on the go.	2025-04-24 00:00:00	Google Play Store	smooth secure experience transfer bill payment tracking expense effortless intuitive design make banking go	positive	0.9991734623908997	0.34	positive	0.4	positive
3296	3	Very easy and Fast.	2025-04-24 00:00:00	Google Play Store	easy fast	positive	0.997892439365387	0.4404	positive	0.31666666666666665	positive
3297	3	Incomparably user-friendly and fast app for mobile banking.	2025-04-24 00:00:00	Google Play Store	incomparably fast app mobile banking	negative	0.9681089520454407	0	neutral	0.2	positive
3298	3	there is nothing super about this app, repeatedly failed transaction and wastes customer valuable time. if you have to do system upgrade do it at a time when there is less traffic demand. your Technical difficulty should not be reflected on customer.	2025-04-24 00:00:00	Google Play Store	nothing super app repeatedly failed transaction waste customer valuable time system upgrade time less traffic demand technical difficulty reflected customer	negative	0.995960533618927	-0.8302	negative	-0.10666666666666666	negative
3299	3	execellent	2025-04-24 00:00:00	Google Play Store	execellent	negative	0.9866806864738464	0	neutral	0	neutral
3300	3	This super app is a total game-changer—fast, reliable, and packed with everything I need in one place. It’s seamless and super convenient. Love it!"	2025-04-23 00:00:00	Google Play Store	super app total reliable packed everything need one place seamless super convenient love	positive	0.781987190246582	0.9186	positive	0.2533333333333333	positive
3301	3	All in One ✍️secure ✍️reliable ✍️convenient. Digital banking game changer!!	2025-04-23 00:00:00	Google Play Store	one digital banking game changer	negative	0.9615413546562195	0	neutral	-0.2	negative
3302	3	it is incredible product.	2025-04-23 00:00:00	Google Play Store	incredible product	positive	0.9998781681060791	0	neutral	0.9	positive
3303	3	I'm really impressed with this app! It’s user-friendly, runs smoothly, and has all the features I need. Makes my tasks so much easier and saves me a lot of time. Highly recommended!	2025-04-23 00:00:00	Google Play Store	really impressed app run smoothly feature need make task much easier save lot time highly recommended	positive	0.9959664344787598	0.8882	positive	0.43999999999999995	positive
3304	3	best app	2025-04-23 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3305	3	ok	2025-04-23 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
3306	3	It's an amazing app, experience it!!	2025-04-23 00:00:00	Google Play Store	amazing app experience	positive	0.9998388290405273	0.5859	positive	0.6000000000000001	positive
3307	3	This is the best banking app ever. I recommend everyone to use it.	2025-04-23 00:00:00	Google Play Store	best banking app ever recommend everyone use	positive	0.9995530247688293	0.7717	positive	1	positive
3308	3	It is the best application!!!	2025-04-22 00:00:00	Google Play Store	best application	positive	0.9998098015785217	0.6369	positive	1	positive
3309	3	Exceptional digital experience, SupperApp will bring new paradigm shift in the banking business. Bravo Dashen keep it up!!!!	2025-04-22 00:00:00	Google Play Store	exceptional digital experience supperapp bring new paradigm shift banking business bravo dashen keep	positive	0.99946528673172	0	neutral	0.2676767676767677	positive
3310	3	its features are so dynamic	2025-04-22 00:00:00	Google Play Store	feature dynamic	positive	0.9995842576026917	0.3818	positive	0	neutral
3311	3	fast &Friendly user Application.	2025-04-22 00:00:00	Google Play Store	fast friendly user application	positive	0.9984002709388733	0.4939	positive	0.2875	positive
3312	3	Fast, Reliable and User Friendly. Keep it Up	2025-04-22 00:00:00	Google Play Store	fast reliable user friendly keep	positive	0.9996548891067505	0.4939	positive	0.2875	positive
3313	3	#dashen super app is easy to use, secure & fast transaction😍	2025-04-22 00:00:00	Google Play Store	dashen super app easy use secure fast	negative	0.567264974117279	0.8481	positive	0.3416666666666666	positive
3314	3	i love this app esp 3 click that make e-commerce easier and convinient.	2025-04-22 00:00:00	Google Play Store	love app esp 3 click make easier convinient	positive	0.9915735125541687	0.7906	positive	0.5	positive
3339	3	This app has everything I was looking for, dashen is becoming a grandmaster.	2025-04-21 00:00:00	Google Play Store	app everything looking dashen becoming grandmaster	positive	0.9987133741378784	0	neutral	0.45	positive
3315	3	Dashen Super App contains extended selections for customers and can be easily accessible and also friendly to use.	2025-04-22 00:00:00	Google Play Store	dashen super app contains extended selection customer easily accessible also friendly use	positive	0.9947499632835388	0.8591	positive	0.3611111111111111	positive
3316	3	Great for everyday banking and payments on the go	2025-04-22 00:00:00	Google Play Store	great everyday banking payment go	positive	0.9995524287223816	0.6249	positive	0.30000000000000004	positive
3317	3	"Dashen Super App'' is impressive with its focus on simplicity, speed, and quality. The user interface is clean and easy to understand. Transactions process quickly, and the overall quality of the app is top-notch. A must-have for Dashen Bank customers. ዳሸን ባንክ አንድ እርምጃ ቀዳሚ።	2025-04-22 00:00:00	Google Play Store	dashen super app impressive focus simplicity speed quality user interface clean easy understand transaction process quickly overall quality app dashen bank customer ዳሸን ባንክ አንድ እርምጃ	positive	0.9983946681022644	0.9153	positive	0.42666666666666664	positive
3318	3	making transactions has never been easier. the new update is just amazing	2025-04-22 00:00:00	Google Play Store	making transaction never easier new update amazing	positive	0.9825519323348999	0.3544	positive	0.3681818181818182	positive
3319	3	The app has various usefull functions, which make easy the payment system. Also, it will connect with sellers having reasonable prices.	2025-04-22 00:00:00	Google Play Store	app various usefull function make easy payment system also connect seller reasonable price	negative	0.5802709460258484	0.4404	positive	0.2111111111111111	positive
3320	3	The app has great user interface with comprehensive payments and E-commerce platforms. And also it includes unique features such as chat Banking and budget.	2025-04-22 00:00:00	Google Play Store	app great user interface comprehensive payment platform also includes unique feature chat banking budget	positive	0.9948911666870117	0.7269	positive	0.5875	positive
3321	3	betam mirt Ena betam le atikakem kelel Yale Ena michu application nw	2025-04-22 00:00:00	Google Play Store	betam mirt ena betam le atikakem kelel yale ena michu application nw	negative	0.9886249303817749	0	neutral	0	neutral
3322	3	Convenient!	2025-04-22 00:00:00	Google Play Store	convenient	positive	0.999121367931366	0	neutral	0	neutral
3323	3	It is an amazing application that meets the needs of customers.	2025-04-22 00:00:00	Google Play Store	amazing application meet need customer	positive	0.9996914863586426	0.5859	positive	0.6000000000000001	positive
3324	3	Effecting payment via the app has created convenience to the recipients in easily confirming the payments received!	2025-04-22 00:00:00	Google Play Store	effecting payment via app created convenience recipient easily confirming payment received	negative	0.9750913977622986	0.5267	positive	0.43333333333333335	positive
3325	3	the best Supper App ever	2025-04-22 00:00:00	Google Play Store	best supper app ever	positive	0.9997851252555847	0.6369	positive	1	positive
3326	3	This is the best app ever, when is it planned to include digital lending and gasification?	2025-04-22 00:00:00	Google Play Store	best app ever planned include digital lending gasification	positive	0.9986427426338196	0.6369	positive	0.5	positive
3327	3	A powerful, local solution that rivals any global app. I love how easy it is to explore services and products.	2025-04-22 00:00:00	Google Play Store	powerful local solution rival global app love easy explore service product	positive	0.9994159936904907	0.9042	positive	0.24666666666666667	positive
3328	3	Dashen bank is my number one choice	2025-04-22 00:00:00	Google Play Store	dashen bank number one choice	positive	0.9987853169441223	0.0772	positive	0	neutral
3329	3	Assefa Genetu = Dashen superup is the latest and inclussive .I am happy with this super up.	2025-04-22 00:00:00	Google Play Store	assefa genetu dashen superup latest inclussive happy super	negative	0.5014287233352661	0.8225	positive	0.5444444444444444	positive
3330	3	The App is incredibly user-friendly and brings multiple services into one place. It's fast, intuitive, and makes daily tasks super convenient. A true all-in-one solution!	2025-04-21 00:00:00	Google Play Store	app incredibly brings multiple service one place fast intuitive make daily task super convenient true solution	positive	0.9894616007804871	0.8402	positive	0.2972222222222222	positive
3331	3	Proudly made in Ethiopia, this innovation delivers more than promised. The marketplace is a major boost for local commerce	2025-04-21 00:00:00	Google Play Store	proudly made ethiopia innovation delivers promised marketplace major boost local commerce	positive	0.999762237071991	0.886	positive	0.28750000000000003	positive
3332	3	it so fanrastic and user friendly app. Bravo Dashen bank thanks.	2025-04-21 00:00:00	Google Play Store	fanrastic user friendly app bravo dashen bank thanks	positive	0.9957053065299988	0.7269	positive	0.2875	positive
3333	3	one of the best digital platforms I've used! from smooth transactions to a seamless shopping experience, highly recommended.	2025-04-21 00:00:00	Google Play Store	one best digital platform used smooth transaction seamless shopping experience highly recommended	positive	0.9992096424102783	0.7425	positive	0.33199999999999996	positive
3334	3	A proudly Ethiopia innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers bnd sellers	2025-04-21 00:00:00	Google Play Store	proudly ethiopia innovation delivers beyond expectation marketplace feature big win local shopper bnd seller	positive	0.9995040893554688	0.875	positive	0.4	positive
3335	3	Dashen Super App is a game-changer! It’s fast, user-friendly, and packed with features that make everyday banking and transactions super convenient. I love how everything I need from mobile banking to utility payments is all in one place. The interface is clean, and everything works smoothly. Definitely one of the best apps out there. Highly recommended!	2025-04-21 00:00:00	Google Play Store	dashen super app fast packed feature make everyday banking transaction super convenient love everything need mobile banking utility payment one place interface clean everything work smoothly definitely one best apps highly recommended	positive	0.9997102618217468	0.9741	positive	0.2992592592592593	positive
3336	3	Easy to use and has many options. It is the best financial app I have ever used.	2025-04-21 00:00:00	Google Play Store	easy use many option best financial app ever used	positive	0.989372193813324	0.7964	positive	0.48333333333333334	positive
3337	3	Highly impressed! Dash Bank really nailed it with this app. Secure, reliable, and packed with features I use daily	2025-04-21 00:00:00	Google Play Store	highly impressed dash bank really nailed app secure reliable packed feature use daily	positive	0.9990358352661133	0.7233	positive	0.4	positive
3338	3	One of the best digital platforms I’ve used! From smooth transactions to a seamless shopping experience, Highly recommended	2025-04-21 00:00:00	Google Play Store	one best digital platform used smooth transaction seamless shopping experience highly recommended	positive	0.9992096424102783	0.7425	positive	0.33199999999999996	positive
3340	3	Very convenient	2025-04-21 00:00:00	Google Play Store	convenient	positive	0.999121367931366	0	neutral	0	neutral
3341	3	The user experience is seamless, and everything just works perfectly right out of the box. I can’t believe how much time and effort it saves me every day.	2025-04-21 00:00:00	Google Play Store	user experience seamless everything work perfectly right box believe much time effort save every day	positive	0.9985371828079224	0.8126	positive	0.1952380952380952	positive
3342	3	wawwwww what nice super app !!keep it up dashen bank !!	2025-04-21 00:00:00	Google Play Store	wawwwww nice super app keep dashen bank	positive	0.993996262550354	0.7717	positive	0.4666666666666667	positive
3343	3	Dashen SuperApp the ultimate all-in-one solution! From banking and shopping to bill payments, everything you need is right at your fingertips. Life just got a whole lot easier!	2025-04-21 00:00:00	Google Play Store	dashen superapp ultimate solution banking shopping bill payment everything need right fingertip life got whole lot easier	negative	0.9704668521881104	0.6249	positive	0.1619047619047619	positive
3344	3	It is,really super because of its unique offerings to individuals and businesses.It is a secure UX first app intended to cater comprehensive digital meeds.I am also happy to know that Dashen is considering to make the app more inclusive by lowering the mobile version requirements .	2025-04-21 00:00:00	Google Play Store	really super unique offering individual secure ux first app intended cater comprehensive digital also happy know dashen considering make app inclusive lowering mobile version requirement	positive	0.9980731010437012	0.8832	positive	0.3083333333333333	positive
3345	3	the very easy, secured, fast and multifunctional dashen supper application I ever seen. dashen really one steps ahead!!!	2025-04-21 00:00:00	Google Play Store	easy secured fast multifunctional dashen supper application ever seen dashen really one step ahead	positive	0.995043158531189	0.6808	positive	0.27777777777777773	positive
3346	3	One app for everything! I can shop, manage my bank account , and do so much more . Truly a super app	2025-04-21 00:00:00	Google Play Store	one app everything shop manage bank account much truly super app	positive	0.9974272847175598	0.7783	positive	0.26666666666666666	positive
3347	3	one of the best digital platforms I’ve used! From smooth transactions to a seamless shopping experie	2025-04-21 00:00:00	Google Play Store	one best digital platform used smooth transaction seamless shopping experie	positive	0.9979416728019714	0.6369	positive	0.375	positive
3348	3	Dashen Bank super App is the most suitable, reliable, and fast digital banking system.	2025-04-21 00:00:00	Google Play Store	dashen bank super app suitable reliable fast digital banking system	positive	0.9905745387077332	0.5994	positive	0.2708333333333333	positive
3349	3	Excellent app.	2025-04-21 00:00:00	Google Play Store	excellent app	positive	0.9998356103897095	0.5719	positive	1	positive
3350	3	This is what we call banking app. As professional I want banking app as simple as this and an app rich of features that align with my lifestyle.	2025-04-21 00:00:00	Google Play Store	call banking app professional want banking app simple app rich feature align lifestyle	positive	0.9873248338699341	0.5994	positive	0.15833333333333333	positive
3351	3	thanks again	2025-04-21 00:00:00	Google Play Store	thanks	positive	0.9998080134391785	0.4404	positive	0.2	positive
3352	3	Super Easy To Use and Fast Transaction.	2025-04-21 00:00:00	Google Play Store	super easy use fast transaction	positive	0.6839423775672913	0.7783	positive	0.3222222222222222	positive
3353	3	I have an incredible experience with Dashen super app, what an amazing platform is it?. keep pioneering in technological advancement 👏👏👏	2025-04-21 00:00:00	Google Play Store	incredible experience dashen super app amazing platform keep pioneering technological advancement	positive	0.999678373336792	0.8271	positive	0.6111111111111112	positive
3354	3	i can't recommend the Dashen Super App enough! This app is truly a game changer for anyone looking for a seamless and efficient way to manage their daily life. It combines multiple essential services into one easy-to-use platform, saving time and simplifying tasks The user interface is modern, intuitive, and super responsive, making navigation a breeze. Whether it's banking, payment services, or accessing lifestyle features, everything is just a few clicks away!!	2025-04-21 00:00:00	Google Play Store	ca recommend dashen super app enough app truly game changer anyone looking seamless efficient way manage daily life combine multiple essential service one platform saving time simplifying task user interface modern intuitive super responsive making navigation breeze whether banking payment service accessing lifestyle feature everything click away	positive	0.9969197511672974	0.9552	positive	0.06296296296296296	positive
3355	3	The app is incredibly handy for managing multiple financial tasks, from bill payments to managing budgets. It’s saved me a lot of time and made banking way more convenient. Definitely worth checking out!	2025-04-21 00:00:00	Google Play Store	app incredibly handy managing multiple financial task bill payment managing budget saved lot time made banking way convenient definitely worth checking	positive	0.993610680103302	0.7506	positive	0.22499999999999998	positive
3356	3	what an App	2025-04-21 00:00:00	Google Play Store	app	positive	0.9684572219848633	0	neutral	0	neutral
3357	3	The new e-commerce feature is incredibly amazing and user friendly.	2025-04-21 00:00:00	Google Play Store	new feature incredibly amazing user friendly	positive	0.9998619556427002	0.8204	positive	0.3704545454545454	positive
3358	3	dashen bank supper app is the most easy to use and have high speed,quality and I like features like chat,budget,fuel payment, and security for my opinion this product is techonolgy edge,this international standard thanks for product oweners (dashen bank)	2025-04-21 00:00:00	Google Play Store	dashen bank supper app easy use high speed quality like feature like chat budget fuel payment security opinion product techonolgy edge international standard thanks product oweners dashen bank	negative	0.7807394862174988	0.9042	positive	0.15866666666666668	positive
3359	3	The Dashen supperapp is a revolutionary advancement in digital banking, combining exceptional usability, an intuitive interface and a seamless user experience. among its standout features are the integration of QR codes, account statement, transaction advise, chat, transaction authentication for limit thresholds, budgeting and different app in a single dashboard. Truly ahead of the curve ..... keep up the excellent work 🤝👏	2025-04-21 00:00:00	Google Play Store	dashen supperapp revolutionary advancement digital banking combining exceptional usability intuitive interface seamless user experience among standout feature integration qr code account statement transaction advise chat transaction authentication limit threshold budgeting different app single dashboard truly ahead curve keep excellent work	positive	0.9995949864387512	0.765	positive	0.28253968253968254	positive
3360	3	A proudly Ethiopian innovation that delivers beyond expectations. The marketplace feature is a big win for local shoppers and sellers. Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants!	2025-04-21 00:00:00	Google Play Store	proudly ethiopian innovation delivers beyond expectation marketplace feature big win local shopper seller impressed new update section smooth support ethiopian merchant	positive	0.9996368885040283	0.9413	positive	0.44805194805194803	positive
3361	3	Very impressed with the new updates, The e-commerce section is smooth and supports Ethiopian merchants.	2025-04-21 00:00:00	Google Play Store	impressed new update section smooth support ethiopian merchant	positive	0.9993155002593994	0.7003	positive	0.5121212121212121	positive
3362	3	Dashen Bank Super App is fast, reliable, and super easy to use. All my banking needs are handled smoothly in one place. Clean design and seamless experience – highly recommended!	2025-04-21 00:00:00	Google Play Store	dashen bank super app fast reliable super easy use banking need handled smoothly one place clean design seamless experience highly recommended	positive	0.9968836903572083	0.9381	positive	0.2908333333333334	positive
3363	3	Db sup app is A platform or an application that can grasp more satisfactions through fastest mode of operation which means for budget planning, to use QR code(scan, pay, go) chat with staff, acc to acc other bank ft, merchant payment, and easly. I addition to i satisfied and i invite everyone to use those platform!!.	2025-04-21 00:00:00	Google Play Store	db sup app platform application grasp satisfaction fastest mode operation mean budget planning use qr code scan pay go chat staff acc acc bank ft merchant payment easly addition satisfied invite everyone use platform	negative	0.9917150139808655	0.7096	positive	0.09375	positive
3364	3	the chat banking and unique and only app that alow money request!!	2025-04-21 00:00:00	Google Play Store	chat banking unique app alow money request	negative	0.9602183699607849	0	neutral	0.375	positive
3365	3	Better and inclusive app!	2025-04-21 00:00:00	Google Play Store	better inclusive app	positive	0.9957422614097595	0.4404	positive	0.5	positive
3366	3	Amazing Application	2025-04-21 00:00:00	Google Play Store	amazing application	positive	0.9998698234558105	0.5859	positive	0.6000000000000001	positive
3367	3	It keep my time to pay my bills and I generate my satment easily	2025-04-21 00:00:00	Google Play Store	keep time pay bill generate satment easily	positive	0.9430363178253174	0.25	positive	0.43333333333333335	positive
3368	3	It's an amazing app that is up-to-date with the times, wow wow	2025-04-21 00:00:00	Google Play Store	amazing app time wow wow	positive	0.999825656414032	0.9081	positive	0.26666666666666666	positive
3369	3	A game-changing Ethiopian innovation—where shopping meets opportunity. The marketplace feature connects buyers and sellers like never before.	2025-04-21 00:00:00	Google Play Store	ethiopian shopping meet opportunity marketplace feature connects buyer seller like never	positive	0.9762321710586548	0.6486	positive	0	neutral
3370	3	Dashen Super App isn’t just an app — it’s an experience. Effortless, powerful, and built for the future	2025-04-21 00:00:00	Google Play Store	dashen super app app experience effortless powerful built future	positive	0.9996675252914429	0.7717	positive	0.2111111111111111	positive
3371	3	This Is An Amazing App with Uniqe Quality,Easy And Fast Mobile Banking App.	2025-04-21 00:00:00	Google Play Store	amazing app uniqe quality easy fast mobile banking app	positive	0.9990082383155823	0.7717	positive	0.41111111111111115	positive
3372	3	Dashen SuperApp is a lifesaver! Banking, shopping, and bills in one super easy app. The new e-commerce feature is awesome and supports local merchants. Fast, secure, and proudly Ethiopian.Download it now—you won’t regret it!	2025-04-21 00:00:00	Google Play Store	dashen superapp lifesaver banking shopping bill one super easy app new feature awesome support local merchant fast secure proudly regret	positive	0.9911386370658875	0.9666	positive	0.41287878787878785	positive
3373	3	Dashen SuperApp blends finance, shopping, and daily services effortlessly. The new e-commerce feature is smooth and supports local merchants—proud to back an Ethiopian-made solution!	2025-04-21 00:00:00	Google Play Store	dashen superapp blend finance shopping daily service effortlessly new feature smooth support local back solution	positive	0.9995388984680176	0.6124	positive	0.10727272727272727	positive
3374	3	A solid step forward by Dashen Bank. The SuperApp combines essential banking features with lifestyle services, making everything accessible in one place. The interface is smooth, and transactions are quick and reliable. It’s clear a lot of thought went into the design and functionality. Great job!	2025-04-21 00:00:00	Google Play Store	solid step forward dashen bank superapp combine essential banking feature lifestyle service making everything accessible one place interface smooth transaction quick reliable clear lot thought went design functionality great job	positive	0.9996205568313599	0.8074	positive	0.28690476190476194	positive
3375	3	Dashen bank super app is the crucial and convenient app in Ethiopia. there is no other app to compare with Dashen bank super app	2025-04-21 00:00:00	Google Play Store	dashen bank super app crucial convenient app ethiopia app compare dashen bank super app	negative	0.9790244102478027	0.8316	positive	0.2222222222222222	positive
3376	3	All-in-one finance & e-commerce super app! Pay, save, shop seamlessly. Fast, secure. #BankAndShop	2025-04-21 00:00:00	Google Play Store	finance super app pay save shop seamlessly fast secure bankandshop	positive	0.9771161675453186	0.8442	positive	0.3111111111111111	positive
3377	3	it's a hestorical app. in the bank industry.	2025-04-21 00:00:00	Google Play Store	hestorical app bank industry	negative	0.9928353428840637	0	neutral	0	neutral
3378	3	A game changer in Ethiopian digital banking fast, secure, and packed with services. Everything you need, all in one powerful app. A true leap toward financial convenience and innovation!	2025-04-21 00:00:00	Google Play Store	game changer ethiopian digital banking fast secure packed service everything need one powerful app true leap toward financial convenience innovation	positive	0.9090520739555359	0.8625	positive	0.12142857142857143	positive
3379	3	easy &,simple to use	2025-04-21 00:00:00	Google Play Store	easy simple use	positive	0.9928313493728638	0.4404	positive	0.21666666666666667	positive
3380	3	Banking, but make it smart. Local solutions, all in one place. Smooth, fast, and actually saving time. Feels like the future. Love it!	2025-04-21 00:00:00	Google Play Store	banking make smart local solution one place smooth fast actually saving time feel like future love	positive	0.999206006526947	0.8934	positive	0.18775510204081633	positive
3381	3	All in one, that is it 👌	2025-04-21 00:00:00	Google Play Store	one	positive	0.9882547855377197	0	neutral	0	neutral
3382	3	, Dashen Bank Supper App is multipurpose, convenient, very attractive and Make life easier	2025-04-21 00:00:00	Google Play Store	dashen bank supper app multipurpose convenient attractive make life easier	positive	0.9766711592674255	0.6908	positive	0.8	positive
3383	3	very easy and flexible app.	2025-04-21 00:00:00	Google Play Store	easy flexible app	positive	0.9994267225265503	0.5859	positive	0.43333333333333335	positive
3384	3	I choose Dashen Bank Super Up since, it is easy to use & it has attractive features !	2025-04-21 00:00:00	Google Play Store	choose dashen bank super since easy use attractive feature	positive	0.8358981013298035	0.8658	positive	0.5222222222222223	positive
3385	3	dashen super app is simple faster and reliable.	2025-04-21 00:00:00	Google Play Store	dashen super app simple faster reliable	positive	0.998654842376709	0.5994	positive	0.16666666666666666	positive
3386	3	Dashen Bank Super App is a game-changer! The user-friendly design, wide range of services, and smooth performance make it incredibly convenient for everyday banking. It’s fast, secure, and truly reflects the bank’s commitment to digital excellence. Highly recommended!	2025-04-21 00:00:00	Google Play Store	dashen bank super app design wide range service smooth performance make incredibly convenient everyday banking fast secure truly reflects bank commitment digital excellence highly recommended	positive	0.9994561076164246	0.9516	positive	0.23259259259259257	positive
3387	3	The app keeps getting better with every update! Smooth performance, great UI, and top-notch security. Thank you for making banking so convenient!"	2025-04-21 00:00:00	Google Play Store	app keep getting better every update smooth performance great ui security thank making banking convenient	positive	0.9944328665733337	0.8979	positive	0.5666666666666668	positive
3388	3	this app is the most simply to use and secure safe i love it to use for any bank transaction	2025-04-21 00:00:00	Google Play Store	app simply use secure safe love use bank transaction	negative	0.7634596824645996	0.8591	positive	0.35	positive
3389	3	After i download the app recently had a smooth expriance, its user friendly, fast, and everything works as expected. keep up the good work.	2025-04-21 00:00:00	Google Play Store	download app recently smooth expriance user friendly fast everything work expected keep good work	positive	0.9839036464691162	0.7269	positive	0.31500000000000006	positive
3390	3	An app with High performance and advanced features!	2025-04-21 00:00:00	Google Play Store	app high performance advanced feature	positive	0.9960998296737671	0.25	positive	0.28	positive
3391	3	It is a very user friendly, attractive user interface, full of useful features. I really encourage everyone to give it a try.	2025-04-21 00:00:00	Google Play Store	user friendly attractive user interface full useful feature really encourage everyone give try	positive	0.9996606111526489	0.9117	positive	0.40499999999999997	positive
3392	3	Good actually , but it have to WORK when developer option is on 🙏	2025-04-21 00:00:00	Google Play Store	good actually work developer option	positive	0.9997861981391907	0.4404	positive	0.35	positive
3393	3	All-in-one convenience, From managing accounts to paying bills and shopping online and the chat banking is game changer, this app does it all seamlessly.	2025-04-21 00:00:00	Google Play Store	convenience managing account paying bill shopping online chat banking game changer app seamlessly	negative	0.9375861883163452	0	neutral	-0.15000000000000002	negative
3394	3	I appreciate that Dashen Bank takes lifestyle services into account.	2025-04-21 00:00:00	Google Play Store	appreciate dashen bank take lifestyle service account	positive	0.9981811046600342	0.4019	positive	0	neutral
3395	3	keep it up!	2025-04-21 00:00:00	Google Play Store	keep	positive	0.9988995790481567	0	neutral	0	neutral
3396	3	amazing app really i loved it .that's why we say dashen bank is one stap ahead. It's the best mobile application that should be on every phone.	2025-04-21 00:00:00	Google Play Store	amazing app really loved say dashen bank one stap ahead best mobile application every phone	positive	0.9994602799415588	0.9216	positive	0.7666666666666666	positive
3397	3	very comfortable app keep it	2025-04-21 00:00:00	Google Play Store	comfortable app keep	positive	0.9997735619544983	0.5106	positive	0.4	positive
3398	3	it has clear detail information about the application so it helps customer how to use the app. and it is very easy to use and also app is secure.	2025-04-21 00:00:00	Google Play Store	clear detail information application help customer use app easy use also app secure	positive	0.975040853023529	0.8625	positive	0.3111111111111111	positive
3399	3	I have been using the Dashen Supper app mobile banking app , and overall, I appreciate its features.However,I’ve noticed that when I turn on the developer options on my device, the app stops functioning properly. It would be great if you could look into this issue, as I often need to access developer settings for other applications . Thank you for your attention to this matter!	2025-04-21 00:00:00	Google Play Store	using dashen supper app mobile banking app overall appreciate noticed turn developer option device app stop functioning properly would great could look issue often need access developer setting application thank attention matter	negative	0.9840366244316101	0.802	positive	0.26666666666666666	positive
3400	3	easiness to use with fast response time	2025-04-21 00:00:00	Google Play Store	easiness use fast response time	positive	0.5173691511154175	0.3818	positive	0.2	positive
3401	3	The new mobile banking application is a major upgrade! It’s incredibly user-friendly, with a clean and modern design that makes navigation simple and intuitive. I really appreciate how fast it loads and how smooth the overall experience is. All essential services like balance checks, transfers, and bill payments are eas y to find and use. The added security features give me peace of mind, and the app runs reliably without crashes or glitches. It’s clear a lot of thought went into the user experi	2025-04-21 00:00:00	Google Play Store	new mobile banking application major upgrade incredibly clean modern design make navigation simple intuitive really appreciate fast load smooth overall experience essential service like balance check transfer bill payment ea find use added security feature give peace mind app run reliably without crash glitch clear lot thought went user experi	positive	0.9979629516601562	0.9254	positive	0.15141184573002756	positive
3402	3	As an Internal Customer, Dashen Bank SuperApp has greatly simplified my online banking experience. It's easy to use, allowing me to quickly check balances, transfer money and pay Bills. The app's advanced security features are highly secure, ensuring my data is well protected. The Three click, Chat Banking and IPS features have also given me a smarter experience. In deed Dashen Bank is always steping ahead!	2025-04-21 00:00:00	Google Play Store	internal customer dashen bank superapp greatly simplified online banking experience easy use allowing quickly check balance transfer money pay bill app advanced security feature highly secure ensuring data well protected three click chat banking ip feature also given smarter experience deed dashen bank always steping ahead	positive	0.9923473596572876	0.9514	positive	0.39444444444444443	positive
3403	3	A truly impressive app — user-friendly and a game-changer in Ethiopian banking. The Dashen Super App stands out as one of the most innovative and convenient digital banking solutions in Ethiopia’s financial history. Smooth navigation, seamless features, and a wide range of services all in one place. Well done!	2025-04-21 00:00:00	Google Play Store	truly impressive app ethiopian banking dashen super app stand one innovative convenient digital banking solution ethiopia financial history smooth navigation seamless feature wide range service one place well done	positive	0.9994285702705383	0.9468	positive	0.2791666666666667	positive
3404	3	dashen bank super up has very fast and convenience and also it has contain more things on one app .I am very interesting to use dashen bank super up	2025-04-21 00:00:00	Google Play Store	dashen bank super fast convenience also contain thing one app interesting use dashen bank super	positive	0.9587305188179016	0.8885	positive	0.3416666666666666	positive
3405	3	The Dashen Bank Super App has truly elevated my mobile banking experience. It's fast, user-friendly, and packed with all the essential features. The interface is clean and intuitive, making navigation easy even for first-time users. I also appreciate the added security features that give me peace of mind while banking on the go. Dashen Bank has done an amazing job with this app—it’s reliable, efficient, and always improving. Highly recommended for anyone looking for seamless digital banking!	2025-04-21 00:00:00	Google Play Store	dashen bank super app truly elevated mobile banking experience fast packed essential feature interface clean intuitive making navigation easy even user also appreciate added security feature give peace mind banking go dashen bank done amazing job reliable efficient always improving highly recommended anyone looking seamless digital banking	positive	0.9997062087059021	0.9841	positive	0.24370370370370376	positive
3406	3	A fantastic product!! keep the good work.	2025-04-21 00:00:00	Google Play Store	fantastic product keep good work	positive	0.9998798370361328	0.7579	positive	0.55	positive
3407	3	I am very impressed with the Dashen super app. It is user-friendly and operates efficiently. The budget and chatbot features are impressive, and all items can be purchased with just three clicks.	2025-04-21 00:00:00	Google Play Store	impressed dashen super app operates efficiently budget chatbot feature impressive item purchased three click	positive	0.9994403719902039	0.9186	positive	0.7777777777777777	positive
3408	3	The Dashen Super App offers a quick and user-friendly experience, bringing together a variety of services, like budgeting, payments, airtime recharges, and more, all in one convenient platform. Its sleek design and intuitive navigation ensure effortless transactions. It's evident that Dashen Bank has carefully crafted the app to make everyday financial activities easier. A great choice for anyone aiming to streamline their digital routines!	2025-04-21 00:00:00	Google Play Store	dashen super app offer quick experience bringing together variety service like budgeting payment airtime recharges one convenient platform sleek design intuitive navigation ensure effortless transaction evident dashen bank carefully crafted app make everyday financial activity easier great choice anyone aiming streamline digital routine	positive	0.9983578324317932	0.9468	positive	0.17708333333333334	positive
3409	3	Dashen supper App is the most useful app for our customers	2025-04-21 00:00:00	Google Play Store	dashen supper app useful app customer	positive	0.8582975268363953	0.4404	positive	0.3	positive
3410	3	it is the most amazing mobile app	2025-04-21 00:00:00	Google Play Store	amazing mobile app	positive	0.9998674392700195	0.5859	positive	0.6000000000000001	positive
3411	3	A Good and fast supper app thanks for dashen bank	2025-04-21 00:00:00	Google Play Store	good fast supper app thanks dashen bank	positive	0.9997907280921936	0.7003	positive	0.36666666666666664	positive
3412	3	Dear Users of the Dashen Bank Super App,I have been using the Dashen Bank Super App for a while now, and I must say—it’s truly a game-changer! The app is incredibly fast and reliable; I’ve never encountered any delays with my transactions. One feature I absolutely love is Chat Banking. It makes everyday tasks like checking my balance or transferring money as simple as sending a quick message. Also, the budgeting tool has been a huge help in tracking my spending and giving me a clearer	2025-04-21 00:00:00	Google Play Store	dear user dashen bank super app using dashen bank super app must truly app incredibly fast reliable never encountered delay transaction one feature absolutely love chat banking make everyday task like checking balance transferring money simple sending quick message also budgeting tool huge help tracking spending giving clearer	positive	0.9959677457809448	0.9811	positive	0.2375	positive
3413	3	Too best	2025-04-21 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3414	3	Dashen Bank Super Up,use the app and makes your easy,fast,convinent.	2025-04-21 00:00:00	Google Play Store	dashen bank super use app make easy fast convinent	negative	0.8683892488479614	0.7783	positive	0.3222222222222222	positive
3415	3	To join digital world use supper app and make your life easy	2025-04-21 00:00:00	Google Play Store	join digital world use supper app make life easy	positive	0.9455342888832092	0.6249	positive	0.21666666666666667	positive
3416	3	best mobile banking application	2025-04-21 00:00:00	Google Play Store	best mobile banking application	positive	0.9996380805969238	0.6369	positive	1	positive
3417	3	This banking superapp is incredibly well designed. The design and appearance of the app and the overall experience I have when using the app is fantastic. The app is packed with features from banking to e-commerce all in one place.It even has a budget setting option which is super useful for managing my money. Everything runs smoothly and I love how convenient it has made my daily life. Huge Kudos to Dashen Bank. You are truly living up to the motto ''Always one step ahead." Keep it up!	2025-04-21 00:00:00	Google Play Store	banking superapp incredibly well designed design appearance app overall experience using app fantastic app packed feature banking one even budget setting option super useful managing money everything run smoothly love convenient made daily life huge kudos dashen bank truly living motto always one step ahead keep	positive	0.9993054866790771	0.9764	positive	0.3541666666666667	positive
3418	3	best mobile banking application	2025-04-21 00:00:00	Google Play Store	best mobile banking application	positive	0.9996380805969238	0.6369	positive	1	positive
3419	3	I was really amazed by the idea of an e-commerce service on a banking app. This is what it means to be one step ahead. Please include all kinds of products in there as soon as possible.	2025-04-21 00:00:00	Google Play Store	really amazed idea service banking app mean one step ahead please include kind product soon possible	positive	0.9976446032524109	0.8479	positive	0.121875	positive
3420	3	this is what we expect to get service Dashen Bank always like his slogan	2025-04-21 00:00:00	Google Play Store	expect get service dashen bank always like slogan	negative	0.9917210340499878	0.3612	positive	0	neutral
3421	3	Dashen SupApp is the most contemporary application, offering a great experience by enabling users to perform multiple tasks through a single platform—such as chatting with friends, transferring money, paying bills, and more. It is the first app of its kind in the Ethiopian banking industry, making it a remarkable opportunity for entrepreneurs working in app-based sales and software marketing. Good job, Dashen Bank!	2025-04-21 00:00:00	Google Play Store	dashen supapp contemporary application offering great experience enabling user perform multiple task single chatting friend transferring money paying bill first app kind ethiopian banking industry making remarkable opportunity entrepreneur working sale software marketing good job dashen bank	positive	0.9994331002235413	0.9638	positive	0.39940476190476193	positive
3422	3	Dashen Super App gives me an amazing convenience and makes life easy.	2025-04-21 00:00:00	Google Play Store	dashen super app give amazing convenience make life easy	positive	0.9996932744979858	0.891	positive	0.45555555555555555	positive
3423	3	excellent mobile banking app	2025-04-21 00:00:00	Google Play Store	excellent mobile banking app	positive	0.9998179078102112	0.5719	positive	1	positive
3424	3	Wow! like his name Super App...	2025-04-21 00:00:00	Google Play Store	wow like name super app	positive	0.9992703795433044	0.8807	positive	0.21666666666666667	positive
3425	3	Dashen supper app is the most special. ይምቾቱ ይለያያል!!!!	2025-04-21 00:00:00	Google Play Store	dashen supper app special ይምቾቱ ይለያያል	negative	0.5906432867050171	0.4019	positive	0.35714285714285715	positive
3426	3	convenient and fast	2025-04-21 00:00:00	Google Play Store	convenient fast	positive	0.9980040192604065	0	neutral	0.2	positive
3427	3	Best- in-class app.	2025-04-21 00:00:00	Google Play Store	app	positive	0.9684572219848633	0	neutral	0	neutral
3428	3	I really like this amazing application and Dashen Supper app that has made my life easier.	2025-04-21 00:00:00	Google Play Store	really like amazing application dashen supper app made life easier	positive	0.9980965256690979	0.8648	positive	0.4	positive
3429	3	Superb	2025-04-21 00:00:00	Google Play Store	superb	positive	0.9998656511306763	0.6249	positive	1	positive
3430	3	amazing features, faster and easy to use	2025-04-21 00:00:00	Google Play Store	amazing feature faster easy use	positive	0.9997696280479431	0.7717	positive	0.5166666666666667	positive
3431	3	The Dashen Super App offers a modern, user-friendly experience that leverages the latest technological advancements to deliver a seamless e-commerce platform	2025-04-21 00:00:00	Google Play Store	dashen super app offer modern experience leverage latest technological advancement deliver seamless platform	positive	0.9984425902366638	0.5994	positive	0.2833333333333333	positive
3432	3	Best App!	2025-04-21 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3433	3	I love it. one of the best mobile banking app in the banking industry	2025-04-21 00:00:00	Google Play Store	love one best mobile banking app banking industry	positive	0.9997628331184387	0.8555	positive	0.75	positive
3434	3	I love this app	2025-04-21 00:00:00	Google Play Store	love app	positive	0.9997610449790955	0.6369	positive	0.5	positive
3435	3	no working for me hulum information asgebiche continue or accept yemilew button ayeseram my phone is Samsung A51	2025-04-21 00:00:00	Google Play Store	working hulum information asgebiche continue accept yemilew button ayeseram phone samsung a51	negative	0.9929032921791077	0.3818	positive	0	neutral
3436	3	good	2025-04-20 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3437	3	waw no idea the best app.	2025-04-19 00:00:00	Google Play Store	waw idea best app	positive	0.9926988482475281	0.6369	positive	1	positive
3438	3	fast best app	2025-04-19 00:00:00	Google Play Store	fast best app	positive	0.999737560749054	0.6369	positive	0.6	positive
3439	3	Nice App	2025-04-18 00:00:00	Google Play Store	nice app	positive	0.9998061060905457	0.4215	positive	0.6	positive
3440	3	nice app ever	2025-04-17 00:00:00	Google Play Store	nice app ever	positive	0.9998384714126587	0.4215	positive	0.6	positive
3441	3	good	2025-04-17 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3442	3	very disappointing app. Closes frequently and unstable in function	2025-04-17 00:00:00	Google Play Store	disappointing app close frequently unstable function	negative	0.9997453093528748	-0.6908	negative	-0.25	negative
3443	3	Feature-rich? Absolutely. But the speed? Painfully slow. Seriously, is it communicating with a server on Mars or something?	2025-04-16 00:00:00	Google Play Store	absolutely speed painfully slow seriously communicating server mar something	negative	0.9990994930267334	-0.6573	negative	-0.14444444444444446	negative
3444	3	nic app	2025-04-16 00:00:00	Google Play Store	nic app	positive	0.9797857403755188	0	neutral	0	neutral
3445	3	Nice	2025-04-16 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3446	3	The Dashen Super App delivers a remarkably fast, highly secure, and exceptionally user-friendly experience, establishing it as a leading application in its category.keep it up and stay ahead Dashen Bank.	2025-04-14 00:00:00	Google Play Store	dashen super app delivers remarkably fast highly secure exceptionally experience establishing leading application stay ahead dashen bank	positive	0.9997753500938416	0.7818	positive	0.4	positive
3447	3	So far so good! their in person customer service is amazing 👏	2025-04-14 00:00:00	Google Play Store	far good person customer service amazing	positive	0.9998664855957031	0.7717	positive	0.4666666666666666	positive
3448	3	The app is very backward and doesn't always work. If it works three hours out of 24 hours it's great!😥	2025-04-14 00:00:00	Google Play Store	app backward always work work three hour 24 hour great	positive	0.9724904298782349	0.6249	positive	0.8	positive
3449	3	ምርጫዬ ነው	2025-04-13 00:00:00	Google Play Store	ምርጫዬ ነው	negative	0.7850590348243713	0	neutral	0	neutral
3450	3	It's bad for the connection and too many days are it that not working	2025-04-12 00:00:00	Google Play Store	bad connection many day working	negative	0.9995260238647461	-0.5423	negative	-0.09999999999999992	negative
3451	3	it's samart	2025-04-10 00:00:00	Google Play Store	samart	positive	0.998528003692627	0	neutral	0	neutral
3452	3	The app is not working properly, I have been using it.	2025-04-10 00:00:00	Google Play Store	app working properly using	positive	0.9957824945449829	0	neutral	0	neutral
3453	3	it is very good app	2025-04-10 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
3454	3	I had a disappointing experience with Dashen Bank's Super Up service. The app is very slow and takes forever to load during transactions, which is incredibly frustrating. Additionally, it doesn't generate receipts for any transactions, making it difficult to keep track of my expenses. I also reached out to customer support, but the response time was longer than expected. Overall, I was hoping for a better experience, but I find the service lacking and in need of improvement.	2025-04-09 00:00:00	Google Play Store	disappointing experience dashen bank super service app slow take forever load transaction incredibly frustrating additionally generate receipt transaction making difficult keep track expense also reached customer support response time longer expected overall hoping better experience find service lacking need improvement	negative	0.9979751706123352	0.7787	positive	-0.13333333333333336	negative
3455	3	slow cumbersome	2025-04-08 00:00:00	Google Play Store	slow cumbersome	negative	0.9997989535331726	0	neutral	-0.30000000000000004	negative
3456	3	Is really 💀	2025-04-08 00:00:00	Google Play Store	really	positive	0.9980352520942688	0	neutral	0.2	positive
3457	3	It's slow to send OTP. it's not reliable. It crushed many times. It needs improvement in many ways	2025-04-07 00:00:00	Google Play Store	slow send otp reliable crushed many time need improvement many way	negative	0.9907700419425964	0.0516	positive	0.15	positive
3584	3	I only see white page	2025-01-23 00:00:00	Google Play Store	see white page	negative	0.9828705787658691	0	neutral	0	neutral
3458	3	This is the worst mobile banking experience I’ve ever had. It doesn’t work when you need it, and it randomly updates itself without warning. You can’t make transactions whenever you want. It’s a nightmare for anyone who relies on this as their main banking option, especially those with a lot of money in their account. I’m lucky I’m not one of them, but still, it’s infuriating not being able to access your money when you need it."l	2025-04-07 00:00:00	Google Play Store	worst mobile banking experience ever work need randomly update without warning make transaction whenever want nightmare anyone relies main banking option especially lot money account lucky one still infuriating able access money need l	negative	0.9995498061180115	-0.521	negative	-0.15714285714285717	negative
3459	3	I have experienced on using the app of Banks in Ethiopia, this Dashen sup is like old version of the applications for using. I gave 3 star for it's very low speed while login and processing	2025-04-07 00:00:00	Google Play Store	experienced using app bank ethiopia dashen sup like old version application using gave 3 star low speed login processing	negative	0.9972701668739319	0.1027	positive	0.3	positive
3460	3	proud by dashen bank	2025-04-06 00:00:00	Google Play Store	proud dashen bank	positive	0.9998334646224976	0.4767	positive	0.8	positive
3461	3	best	2025-04-06 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3462	3	best of best	2025-04-05 00:00:00	Google Play Store	best best	positive	0.9998223185539246	0.8555	positive	1	positive
3463	3	nice	2025-04-04 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3464	3	This app is not working unless you turn off developer mode on your phone. So it takes your rights to just use it.	2025-04-04 00:00:00	Google Play Store	app working unless turn developer mode phone take right use	negative	0.989779531955719	0	neutral	0.2857142857142857	positive
3465	3	real super up	2025-04-04 00:00:00	Google Play Store	real super	positive	0.9997572302818298	0.5994	positive	0.5	positive
3466	3	it's very disappointing fix it as soon as possible not expected from dashin bank fix it	2025-04-04 00:00:00	Google Play Store	disappointing fix soon possible expected dashin bank fix	negative	0.9967193007469177	-0.4939	negative	-0.2333333333333333	negative
3467	3	why dashen bank workers hidden my ATM Card 🏧?it's a big problem to me	2025-04-04 00:00:00	Google Play Store	dashen bank worker hidden atm card big problem	negative	0.9964361190795898	-0.4019	negative	-0.08333333333333333	negative
3468	3	good	2025-04-04 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3469	3	tanku	2025-04-04 00:00:00	Google Play Store	tanku	negative	0.9159653186798096	0	neutral	0	neutral
3470	3	very nice	2025-04-04 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3471	3	perfect	2025-04-03 00:00:00	Google Play Store	perfect	positive	0.9998517036437988	0.5719	positive	1	positive
3472	3	goood	2025-04-02 00:00:00	Google Play Store	goood	negative	0.9943867921829224	0	neutral	0	neutral
3473	3	why does it ask me for both pin and opt even the opt is touch let alone both	2025-04-02 00:00:00	Google Play Store	ask pin opt even opt touch let alone	negative	0.988889217376709	-0.25	negative	0	neutral
3474	3	it is best app easy to use	2025-04-01 00:00:00	Google Play Store	best app easy use	positive	0.9982343912124634	0.7964	positive	0.7166666666666667	positive
3475	3	It is very easy to use and powerful application.	2025-04-01 00:00:00	Google Play Store	easy use powerful application	positive	0.9988314509391785	0.6908	positive	0.3666666666666667	positive
3476	3	this apps have a good feature but but some features like developer mode turn off irritate user	2025-04-01 00:00:00	Google Play Store	apps good feature feature like developer mode turn irritate user	negative	0.8714434504508972	0.3818	positive	0.7	positive
3477	3	This is not only a mobile banking app, it is beyond that. We will access our account easily, we are able to get many information easily here. i.e. exchage rate. We are able to chat with others, we are able to budget, we are able to transfer to other bank and within Dashen. we are able to access many accounts in a single app, we are able to pay bills in QR scan, we are able to make payments and order delivery items here in a single app. #Always one step ahead.	2025-03-31 00:00:00	Google Play Store	mobile banking app beyond access account easily able get many information easily exchage rate able chat others able budget able transfer bank within dashen able access many account single app able pay bill qr scan able make payment order delivery item single app always one step ahead	positive	0.9633975625038147	0.5267	positive	0.3992063492063493	positive
3478	3	wallahi very fantastic Bank	2025-03-31 00:00:00	Google Play Store	wallahi fantastic bank	positive	0.9991859793663025	0.5574	positive	0.4	positive
3479	3	Waw, It's amazing app. thank you Dashen Bank.	2025-03-31 00:00:00	Google Play Store	waw amazing app thank dashen bank	positive	0.9998283386230469	0.743	positive	0.6000000000000001	positive
3480	3	ok	2025-03-30 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
3481	3	nice app	2025-03-29 00:00:00	Google Play Store	nice app	positive	0.9998061060905457	0.4215	positive	0.6	positive
3482	3	I’ve been using the Dashen Bank Super App for a while now, and it’s been a game-changer. The app is super fast and reliable—I’ve never had an issue with transactions being delayed. One of my favorite features is the chat banking, which makes it so easy to do things like check my balance or transfer money just by typing a quick message. The budgeting tool is also really useful. It helps me keep track of my spending and gives me a clear picture of where	2025-03-28 00:00:00	Google Play Store	using dashen bank super app app super fast never issue transaction delayed one favorite feature chat banking make easy thing like check balance transfer money typing quick message budgeting tool also really useful help keep track spending give clear picture	positive	0.9200981855392456	0.9767	positive	0.31666666666666665	positive
3483	3	good	2025-03-28 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3484	3	nice application	2025-03-27 00:00:00	Google Play Store	nice application	positive	0.9998229146003723	0.4215	positive	0.6	positive
3485	3	Very good app that like it too. B/c it is very fast and easy to use.	2025-03-26 00:00:00	Google Play Store	good app like fast easy use	positive	0.9989935755729675	0.8074	positive	0.4444444444444444	positive
3486	3	best experiences	2025-03-26 00:00:00	Google Play Store	best experience	positive	0.9996858835220337	0.6369	positive	1	positive
3487	3	too slow to use.	2025-03-26 00:00:00	Google Play Store	slow use	negative	0.9994843006134033	0	neutral	-0.30000000000000004	negative
3488	3	ጥሩ ነው	2025-03-25 00:00:00	Google Play Store	ጥሩ ነው	negative	0.7850590348243713	0	neutral	0	neutral
3489	3	the worst app in the market only good ui	2025-03-22 00:00:00	Google Play Store	worst app market good ui	negative	0.9995575547218323	-0.296	negative	-0.15000000000000002	negative
3490	3	nic	2025-03-22 00:00:00	Google Play Store	nic	positive	0.9977141618728638	0	neutral	0	neutral
3491	3	በጣም ቅልል ያለ አፕ በርቱልን ለአጠቃቀም ምቹ	2025-03-22 00:00:00	Google Play Store	በጣም ቅልል ያለ አፕ በርቱልን ለአጠቃቀም ምቹ	negative	0.9200406670570374	0	neutral	0	neutral
3492	3	thanks for all digital transaction	2025-03-21 00:00:00	Google Play Store	thanks digital transaction	positive	0.9997575879096985	0.4404	positive	0.1	positive
3493	3	Good	2025-03-21 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3494	3	Best	2025-03-20 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3495	3	Good	2025-03-20 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3496	3	This app is not supporting smart phones that have old android version and so it is none inclusive. At the same time the amole lite is not working properly and once you reached to maximum otp trail mistakes due to network or other errors like stacks , you will be tied up to make Transactions. Ohh... tired!!!!!	2025-03-20 00:00:00	Google Play Store	app supporting smart phone old android version none inclusive time amole lite working properly reached maximum otp trail mistake due network error like stack tied make transaction ohh tired	negative	0.999537467956543	0.128	positive	0.006547619047619043	neutral
3497	3	it's Be Come Busy &not working good	2025-03-20 00:00:00	Google Play Store	come busy working good	positive	0.9964911341667175	0.4404	positive	0.39999999999999997	positive
3498	3	I wanted to share some concerns about your Supper App. It appears to be experiencing reliability issues and isn’t performing as expected. I hope this can be addressed soon to improve the user experience. One star 🌟 for now.	2025-03-19 00:00:00	Google Play Store	wanted share concern supper app appears experiencing reliability issue performing expected hope addressed soon improve user experience one star	negative	0.9968649744987488	0.7906	positive	-0.1	negative
3499	3	best ever digital banking sector essay for understanding ,smart and convince for using	2025-03-19 00:00:00	Google Play Store	best ever digital banking sector essay understanding smart convince using	positive	0.9995757937431335	0.836	positive	0.4047619047619047	positive
3500	3	good and latest	2025-03-18 00:00:00	Google Play Store	good latest	positive	0.9998459815979004	0.4404	positive	0.6	positive
3501	3	The best App of all	2025-03-17 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3502	3	Worst app ever	2025-03-15 00:00:00	Google Play Store	worst app ever	negative	0.9997803568840027	-0.6249	negative	-1	negative
3503	3	This app is the most unreliable mobile banking application I have ever used for transaction, it is very late, non-responsive and full of bugs. Its is very disappointing. It is just inconvinient, and not user friendly and compatabke at all !!!!!!	2025-03-14 00:00:00	Google Play Store	app unreliable mobile banking application ever used transaction late full bug disappointing inconvinient user friendly compatabke	negative	0.9992965459823608	0	neutral	-0.04375000000000001	neutral
3504	3	Naiycapp	2025-03-14 00:00:00	Google Play Store	naiycapp	positive	0.8075174689292908	0	neutral	0	neutral
3505	3	Good	2025-03-13 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3506	3	The app is good but it has no USSD option	2025-03-13 00:00:00	Google Play Store	app good ussd option	positive	0.9961440563201904	0.4404	positive	0.7	positive
3507	3	Hey great	2025-03-12 00:00:00	Google Play Store	hey great	positive	0.999745786190033	0.6249	positive	0.8	positive
3508	3	I have used many mobile banking and also tellebir and mpesa nothing come close to this app. Well done Dashen indeed one step a head. A lot of cool features that amole hasn't the receipt and the account statement is superb for me. I hope you add more integrated small apps to.	2025-03-12 00:00:00	Google Play Store	used many mobile banking also tellebir mpesa nothing come close app well done dashen indeed one step head lot cool feature amole receipt account statement superb hope add integrated small apps	positive	0.9970499277114868	0.886	positive	0.4	positive
3509	3	The app is good but it ask update every week so tiring	2025-03-11 00:00:00	Google Play Store	app good ask update every week tiring	negative	0.9816670417785645	0.4404	positive	0.7	positive
3510	3	It good and easy to use	2025-03-11 00:00:00	Google Play Store	good easy use	positive	0.9997110962867737	0.7003	positive	0.5666666666666667	positive
3511	3	በጣም አሪፍ መተግበሪያ ነው ። አመሠግናለሁ ።	2025-03-10 00:00:00	Google Play Store	በጣም አሪፍ መተግበሪያ ነው አመሠግናለሁ	negative	0.8832131028175354	0	neutral	0	neutral
3512	3	Greately improved since it was released! I really like the budget and expense tegistration feature. For ATM or POS withdrawals, it is not possible to account these expenses, even if it is visible on the transactions window. If that can be worked on, it will be improve so much!!	2025-03-10 00:00:00	Google Play Store	greately improved since released really like budget expense tegistration feature atm po withdrawal possible account expense even visible transaction window worked improve much	positive	0.9969755411148071	0.6478	positive	0.13333333333333333	positive
3513	3	Excellent	2025-03-10 00:00:00	Google Play Store	excellent	positive	0.9998434782028198	0.5719	positive	1	positive
3514	3	Good	2025-03-08 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3515	3	Wow Excellent app	2025-03-08 00:00:00	Google Play Store	wow excellent app	positive	0.9998443126678467	0.8176	positive	0.55	positive
3516	3	Nice app but i experience some issues with others banks transfer it keeps saying account is not exist most of the time.	2025-03-08 00:00:00	Google Play Store	nice app experience issue others bank transfer keep saying account exist time	positive	0.951657772064209	0.4215	positive	0.6	positive
3517	3	Add the option to send money to any telebirr account like amole does.	2025-03-08 00:00:00	Google Play Store	add option send money telebirr account like amole	negative	0.9891737699508667	0.3612	positive	0	neutral
3518	3	It's best	2025-03-08 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3519	3	no one dashen yichlal	2025-03-07 00:00:00	Google Play Store	one dashen yichlal	positive	0.927041232585907	0	neutral	0	neutral
3520	3	In short ! I'm so proud of this app developers for their highest professional of developing. Thanks	2025-03-06 00:00:00	Google Play Store	short proud app developer highest professional developing thanks	positive	0.9995074272155762	0.7184	positive	0.275	positive
3521	3	The speed is too slow. Need some improvements.	2025-03-06 00:00:00	Google Play Store	speed slow need improvement	negative	0.9966747760772705	0.4588	positive	-0.30000000000000004	negative
3522	3	good app	2025-03-04 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
3523	3	Fantastic app	2025-03-01 00:00:00	Google Play Store	fantastic app	positive	0.9998588562011719	0.5574	positive	0.4	positive
3524	3	Good	2025-02-28 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3525	3	I wish dark mode feature is add as an option but it's good app	2025-02-27 00:00:00	Google Play Store	wish dark mode feature add option good app	positive	0.9980168342590332	0.6808	positive	0.27499999999999997	positive
3526	3	Super Up is the ultimate digital banking app, living up to its name with speed, efficiency, and innovation. Designed for a seamless experience, it offers lightning-fast transactions, top-tier security, and effortless financial management. With Super Up, banking has never been this smooth, smart, and super!	2025-02-26 00:00:00	Google Play Store	super ultimate digital banking app living name speed efficiency innovation designed seamless experience offer transaction security effortless financial management super banking never smooth smart super	negative	0.9771804809570312	0.9512	positive	0.12380952380952381	positive
3527	3	The Dashen Super App is a game-changer in digital banking, offering a seamless and convenient experience. With its user-friendly interface, fast transactions, and a wide range of financial services, it simplifies banking for customers. Features like bill payments, fund transfers, mobile top-ups, and loan applications make it an all-in-one solution. Plus, its security measures ensure safe and reliable Experiance effortless banking	2025-02-26 00:00:00	Google Play Store	dashen super app digital banking offering seamless convenient experience interface fast transaction wide range financial service simplifies banking customer feature like bill payment fund transfer mobile loan application make solution plus security measure ensure safe reliable experiance effortless banking	positive	0.965223491191864	0.9393	positive	0.1476190476190476	positive
3528	3	ከጰነጨየጠ	2025-02-26 00:00:00	Google Play Store	ከጰነጨየጠ	negative	0.6970565915107727	0	neutral	0	neutral
3529	3	It has good feature. But, it is Very Slow! difficult to pay or receive. The Speed should be improved, else I didn't recommend.	2025-02-24 00:00:00	Google Play Store	good feature slow difficult pay receive speed improved else recommend	positive	0.9758307337760925	0.6808	positive	-0.03333333333333336	neutral
3530	3	Excellent app	2025-02-24 00:00:00	Google Play Store	excellent app	positive	0.9998356103897095	0.5719	positive	1	positive
3531	3	አፕልኬሽኑ አሪፍ ሆኖ ሳለ ቴሌብር ወደራስ ብቻ ለምን ሆነ እንደ ድሮው ለሰውም መላክ ቢቻል	2025-02-22 00:00:00	Google Play Store	አፕልኬሽኑ አሪፍ ሆኖ ሳለ ቴሌብር ወደራስ ብቻ ለምን ሆነ እንደ ድሮው ለሰውም መላክ ቢቻል	negative	0.9528433680534363	0	neutral	0	neutral
3532	3	No good	2025-02-22 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3533	3	Wow amazing app	2025-02-21 00:00:00	Google Play Store	wow amazing app	positive	0.9998513460159302	0.8225	positive	0.35000000000000003	positive
3534	3	best platform... Please avoid otp	2025-02-21 00:00:00	Google Play Store	best platform please avoid otp	negative	0.7131868004798889	0.6486	positive	1	positive
3535	3	Super smart app.	2025-02-18 00:00:00	Google Play Store	super smart app	positive	0.9997449517250061	0.765	positive	0.2738095238095238	positive
3536	3	best 👍👍	2025-02-16 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3537	3	I don't know what happens but the application is not send verification pass code you should fix that	2025-02-16 00:00:00	Google Play Store	know happens application send verification pas code fix	negative	0.9880629777908325	0	neutral	0	neutral
3538	3	This app doesn't work on my phone my phone is Samsung Galaxy s7 android version 9 All other financial apps work like telebirr CBE M_pesa...	2025-02-14 00:00:00	Google Play Store	app work phone phone samsung galaxy s7 android version 9 financial apps work like telebirr cbe	negative	0.9857349991798401	0.3612	positive	0	neutral
3539	3	Dashen Super app is secure, very easy to use and has more services uniquely like budgeting, chat, IPS...	2025-02-14 00:00:00	Google Play Store	dashen super app secure easy use service uniquely like budgeting chat ip	positive	0.8779343366622925	0.8934	positive	0.3854166666666667	positive
3540	3	Amazing and user friendly supper app and looking forward the additional features	2025-02-14 00:00:00	Google Play Store	amazing user friendly supper app looking forward additional feature	positive	0.9997376799583435	0.7906	positive	0.48750000000000004	positive
3541	3	it's amazing app i have seen ever	2025-02-13 00:00:00	Google Play Store	amazing app seen ever	positive	0.9998200535774231	0.5859	positive	0.6000000000000001	positive
3542	3	One star deducted for not to able to transfer to telebirr.	2025-02-13 00:00:00	Google Play Store	one star deducted able transfer telebirr	negative	0.99744713306427	0	neutral	0.5	positive
3543	3	ጥሩ ነው ግን በደንብ ሊሸሻል ይገባል	2025-02-13 00:00:00	Google Play Store	ጥሩ ነው ግን በደንብ ሊሸሻል ይገባል	negative	0.9046952724456787	0	neutral	0	neutral
3544	3	ፍጥነቱ በጣም አሪፍ ነው! እና ቀለል ያለ ነው ! ነገር ግን ተጨማሪ ወደ ቴሌብር ኤጀንት መላኪያ አፕ ቢካተትበት ጥሩ ነው::	2025-02-12 00:00:00	Google Play Store	ፍጥነቱ በጣም አሪፍ ነው እና ቀለል ያለ ነው ነገር ግን ተጨማሪ ወደ ቴሌብር ኤጀንት መላኪያ አፕ ቢካተትበት ጥሩ ነው	negative	0.9595013856887817	0	neutral	0	neutral
3545	3	Keep up the good work and pleas add water and electric utility payment	2025-02-12 00:00:00	Google Play Store	keep good work plea add water electric utility payment	positive	0.9904090166091919	0.4404	positive	0.7	positive
3546	3	The app missed some important features 1. It does't show recent transactions 2. Transfer to Telebirr limited to own telebirr 3. The statement does't show running balance	2025-02-11 00:00:00	Google Play Store	app missed important feature show recent transaction transfer telebirr limited telebirr statement show running balance	negative	0.9982157945632935	-0.3182	negative	0.10952380952380954	positive
3547	3	Simple, Fast and Easy ⭐⭐⭐🎉	2025-02-10 00:00:00	Google Play Store	simple fast easy	positive	0.9992534518241882	0.4404	positive	0.2111111111111111	positive
3583	3	This app is literally the best thing ever The chat banking is so easy just text and it’s done Super smooth, fast, and honestly a life saverIf you haven’t downloaded it yet you’re missing out big time	2025-01-23 00:00:00	Google Play Store	app literally best thing ever chat banking easy text done super smooth fast honestly life saverif downloaded yet missing big time	negative	0.942258894443512	0.9153	positive	0.3458333333333333	positive
3548	3	የሚገርም aplication ነው, ነገር ግን ብር ትራንስፈር ሲደረግ ያለ ፒን መሆኑ risk አለው ሁሉ ጊዜ የ ትራንስፈር መደምደሚያ ፒን መሆን አለበት!!!!!!!!!!!!:: አሱ ቢስተካከል 5 star አስከዛው ግን 4 ሰጥቻለው::	2025-02-09 00:00:00	Google Play Store	የሚገርም aplication ነው ነገር ግን ብር ትራንስፈር ሲደረግ ያለ ፒን መሆኑ risk አለው ሁሉ ጊዜ የ ትራንስፈር መደምደሚያ ፒን መሆን አለበት አሱ ቢስተካከል 5 star አስከዛው ግን 4 ሰጥቻለው	negative	0.9482525587081909	-0.2732	negative	0	neutral
3549	3	Baankii daashin baankii hudna galeessa galatoomaa isinii woliin jirra Godina jimmaa magaalaa Aggaaroo irraa Muaz Abamecha Abamilki	2025-02-07 00:00:00	Google Play Store	baankii daashin baankii hudna galeessa galatoomaa isinii woliin jirra godina jimmaa magaalaa aggaaroo irraa muaz abamecha abamilki	negative	0.9961472749710083	0	neutral	0	neutral
3550	3	Good	2025-02-07 00:00:00	Google Play Store	good	positive	0.9998161196708679	0.4404	positive	0.7	positive
3551	3	It doesn't work	2025-02-07 00:00:00	Google Play Store	work	positive	0.9994449019432068	0	neutral	0	neutral
3552	3	#Dashen Super App; Super easy to use, secure, and fast transaction. Love it!	2025-02-07 00:00:00	Google Play Store	dashen super app super easy use secure fast transaction love	positive	0.9610275030136108	0.9538	positive	0.3666666666666667	positive
3553	3	I tried the new Dash Bank Super App today, and it's amazingly easy and fun.I recommend you download and use it. You really like it	2025-02-06 00:00:00	Google Play Store	tried new dash bank super app today amazingly easy recommend download use really like	positive	0.9978153705596924	0.9129	positive	0.27575757575757576	positive
3554	3	Gud app kegza ga mezmn endze new aind ermjh kedme nachu hlam	2025-02-06 00:00:00	Google Play Store	gud app kegza ga mezmn endze new aind ermjh kedme nachu hlam	negative	0.985221803188324	0	neutral	0.13636363636363635	positive
3555	3	Good app, bad security	2025-02-06 00:00:00	Google Play Store	good app bad security	positive	0.890978991985321	0.2023	positive	5.551115123125783e-17	neutral
3556	3	On Transaction page only show sent Transaction. Try to include received transaction.	2025-02-06 00:00:00	Google Play Store	transaction page show sent transaction try include received transaction	negative	0.9819211959838867	0	neutral	0	neutral
3557	3	Wonderful Application 😍	2025-02-05 00:00:00	Google Play Store	wonderful application	positive	0.9998810291290283	0.5719	positive	1	positive
3558	3	I loved it	2025-02-05 00:00:00	Google Play Store	loved	positive	0.999881386756897	0.5994	positive	0.7	positive
3559	3	አሁን ገና አንድ እርምጃ ቀደማችው	2025-02-04 00:00:00	Google Play Store	አሁን ገና አንድ እርምጃ ቀደማችው	negative	0.8832131028175354	0	neutral	0	neutral
3560	3	I am so thankful for having this best app Dashen one step ahead	2025-02-04 00:00:00	Google Play Store	thankful best app dashen one step ahead	positive	0.9991827607154846	0.836	positive	1	positive
3561	3	Not good this app	2025-02-04 00:00:00	Google Play Store	good app	positive	0.9998493194580078	0.4404	positive	0.7	positive
3562	3	Best app	2025-02-04 00:00:00	Google Play Store	best app	positive	0.999686598777771	0.6369	positive	1	positive
3563	3	Excellent app ever but it needs improvement on speed and transaction lists	2025-02-03 00:00:00	Google Play Store	excellent app ever need improvement speed transaction list	positive	0.9960975646972656	0.7717	positive	1	positive
3564	3	Perfect	2025-02-02 00:00:00	Google Play Store	perfect	positive	0.9998517036437988	0.5719	positive	1	positive
3565	3	It does not work functional ,	2025-02-02 00:00:00	Google Play Store	work functional	positive	0.9995833039283752	0	neutral	0	neutral
3566	3	Ok	2025-02-02 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
3567	3	all of dashen bank customers use the application it is good to use	2025-02-01 00:00:00	Google Play Store	dashen bank customer use application good use	positive	0.9935374855995178	0.4404	positive	0.7	positive
3568	3	Gret experience	2025-02-01 00:00:00	Google Play Store	gret experience	negative	0.7600314021110535	0	neutral	0	neutral
3569	3	All good we need more	2025-01-31 00:00:00	Google Play Store	good need	positive	0.999848484992981	0.4404	positive	0.7	positive
3570	3	Dashen super app is easy to use, fast and robust	2025-01-31 00:00:00	Google Play Store	dashen super app easy use fast robust	positive	0.9958296418190002	0.8481	positive	0.3222222222222222	positive
3571	3	it was amazing app.....thank you dashen bank....	2025-01-30 00:00:00	Google Play Store	amazing app thank dashen bank	positive	0.9998487234115601	0.743	positive	0.6000000000000001	positive
3572	3	Dashen bank super app for easy life.	2025-01-30 00:00:00	Google Play Store	dashen bank super app easy life	positive	0.9592306017875671	0.7783	positive	0.3833333333333333	positive
3573	3	Excellent UI/UX and beyond Banking services👍👍	2025-01-30 00:00:00	Google Play Store	excellent beyond banking	positive	0.9998519420623779	0.5719	positive	1	positive
3574	3	Send to oher bank የሚለዉ ዉስጥ ገብተን ወደ addisinternational bank ለመላክ አይሰራም ሁለተኛ ደግሞ ወደ cbe birr ለመላክ account number ይጠይቃል ሞባይል ነበር ነዉ መጠየቅ ያለበት ይመስለኛል	2025-01-29 00:00:00	Google Play Store	send oher bank የሚለዉ ዉስጥ ገብተን ወደ addisinternational bank ለመላክ አይሰራም ሁለተኛ ደግሞ ወደ cbe birr ለመላክ account number ይጠይቃል ሞባይል ነበር ነዉ መጠየቅ ያለበት ይመስለኛል	negative	0.9847065806388855	0.0772	positive	0	neutral
3575	3	Best	2025-01-29 00:00:00	Google Play Store	best	positive	0.9997941851615906	0.6369	positive	1	positive
3576	3	Just Wow	2025-01-29 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3577	3	mobile banking to the next level	2025-01-28 00:00:00	Google Play Store	mobile banking next level	positive	0.9627662301063538	0	neutral	0	neutral
3578	3	Nice	2025-01-25 00:00:00	Google Play Store	nice	positive	0.9998552799224854	0.4215	positive	0.6	positive
3579	3	The first 3 star review is me	2025-01-25 00:00:00	Google Play Store	first 3 star review	positive	0.998117208480835	0	neutral	0.25	positive
3580	3	Is not working	2025-01-25 00:00:00	Google Play Store	working	positive	0.9987824559211731	0	neutral	0	neutral
3581	3	Fast, reliable and user friendly. Amazing chatting features. Keep it up! Always one step ahead!	2025-01-24 00:00:00	Google Play Store	fast reliable user friendly amazing chatting feature keep always one step ahead	positive	0.9997833371162415	0.7906	positive	0.39166666666666666	positive
3582	3	V good ❗️	2025-01-24 00:00:00	Google Play Store	v good	positive	0.9984826445579529	0.4404	positive	0.7	positive
3585	3	Excellent banking app for all your needs! Who needs a physical branch when you can use Dashen Bank Super App Instead! I've never had an issue with anything that Dashen Bank Super App haven't handled swiftly and resolved to my satisfaction and above I don't often write reviews but this is an app/bank that I would highly recommended to everyone 💯 👌👍	2025-01-22 00:00:00	Google Play Store	excellent banking app need need physical branch use dashen bank super app instead never issue anything dashen bank super app handled swiftly resolved satisfaction often write review would highly recommended everyone	positive	0.9931706190109253	0.9606	positive	0.3653333333333333	positive
3586	3	Amizing Application 😍	2025-01-22 00:00:00	Google Play Store	amizing application	negative	0.9935479760169983	0	neutral	0	neutral
3587	3	Fastest and easy to use	2025-01-22 00:00:00	Google Play Store	fastest easy use	positive	0.9964796900749207	0.4404	positive	0.43333333333333335	positive
3588	3	Ok	2025-01-21 00:00:00	Google Play Store	ok	positive	0.9997851252555847	0.296	positive	0.5	positive
3589	3	ጥሩ ነው	2025-01-21 00:00:00	Google Play Store	ጥሩ ነው	negative	0.7850590348243713	0	neutral	0	neutral
3590	3	ስም ብቻ 😏	2025-01-21 00:00:00	Google Play Store	ስም ብቻ	negative	0.7850590348243713	0	neutral	0	neutral
3591	3	Exellent app with exellent banking system and exellent bank ever	2025-01-21 00:00:00	Google Play Store	exellent app exellent banking system exellent bank ever	negative	0.9847196340560913	0	neutral	0	neutral
3592	3	Amazing app to use as usual! But why option of transferring to Telebirr and M pesa which was available on Amole app is omitted?? Dasheen is my favourite keep it up.	2025-01-20 00:00:00	Google Play Store	amazing app use usual option transferring telebirr pesa available amole app omitted dasheen favourite keep	negative	0.6873424649238586	0.5859	positive	0.25000000000000006	positive
3593	3	Needs some improvement	2025-01-20 00:00:00	Google Play Store	need improvement	negative	0.983095109462738	0.4588	positive	0	neutral
3594	3	Amazing	2025-01-20 00:00:00	Google Play Store	amazing	positive	0.999875545501709	0.5859	positive	0.6000000000000001	positive
3595	3	Amazing super app	2025-01-19 00:00:00	Google Play Store	amazing super app	positive	0.9998658895492554	0.8271	positive	0.4666666666666667	positive
3596	3	I hope it will be better than amole	2025-01-18 00:00:00	Google Play Store	hope better amole	negative	0.969506561756134	0.7003	positive	0.5	positive
3597	3	Wly Super App ilove it ❤️ 😍 💖 💕	2025-01-18 00:00:00	Google Play Store	wly super app ilove	negative	0.8581135869026184	0.5994	positive	0.3333333333333333	positive
3598	3	Wow	2025-01-17 00:00:00	Google Play Store	wow	positive	0.999592125415802	0.5859	positive	0.1	positive
3599	3	Dashen yichalal. Ewnetem one step a head	2025-01-17 00:00:00	Google Play Store	dashen yichalal ewnetem one step head	negative	0.9878954887390137	0	neutral	0	neutral
3600	3	It has a Good performance but need more upgrade for more performance like when we login account not be fast balance show other thing looking good. Carry on. Thanks so much for Greatest service	2025-01-17 00:00:00	Google Play Store	good performance need upgrade performance like login account fast balance show thing looking good carry thanks much greatest service	positive	0.9990504384040833	0.9371	positive	0.5599999999999999	positive
\.


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_id_seq', 3, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 3600, true);


--
-- Name: banks banks_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_name_key UNIQUE (name);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.banks(id);


--
-- PostgreSQL database dump complete
--

