import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: HomePageWidget(),
    ));

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> Result = {'info': '', 'imageurl': ''};
  bool _loading = false;
  fetchCityData(city) async {
    _loading = true;
    print('fetchCityData has been called');
    final uri =
        Uri.parse('https://numberplate.adgstudios.co.za/api/v1/getData');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'city': city};
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    String responseBody = response.body;
    //convert responseBody to map
    Map<String, dynamic> responseMAP = json.decode(responseBody);
    setState(() {
      _loading = false;
      Result['info'] = responseMAP['generalInfo'];
      Result['imageurl'] = responseMAP['imageURL'];
    });
  }

  Map<String, dynamic> CarData = {
    "B": "Police vehicles",
    "EC": "Eastern Western Cape",
    "FS": "Free State (formerly Free State) province",
    "G": "Government vehicles (?)",
    "GP": "Gauteng province",
    "L": "Limpopo (Northern) province",
    "M": "Military vehicles",
    "MG": "Mpumalanga province governmental vehicles",
    "MP": "Mpumalanga province",
    "N": "(formerly used for) Limpopo (Northern) province",
    "NC": "Northern Western Cape",
    "NW": "North West province",
    "T": "Transvaal province",
    "WP": "Western Cape (only private license plates)",
    "ZN": "KwaZulu Natal province (only private license plates)",
    "BT": "Bantu Trust vehicles",
    "CA": "Cape Town, Western Cape",
    "CAA": "Cape Town, Western Cape",
    "CAB": "Aberdeen, Western Cape",
    "CAC": "Burgersdorp, Western Cape",
    "CAD": "Alexandria & Paterson, Western Cape",
    "CAE": "Aliwal North, Western Cape",
    "CAF": "Barkly East, Western Cape",
    "CAG": "Barkly West, Western Cape",
    "CAH": "Port Alfred & Bathurst, Western Cape",
    "CAJ": "Bedford, Western Cape",
    "CAL": "Britstown, Western Cape",
    "CAM": "Caledon & Kleinmond, Western Cape",
    "CAN": "Calvinia, Brandvlei & Loeriesfontein, Western Cape",
    "CAO": "Carnarvon, Western Cape",
    "CAP": "Cathcart, Western Cape",
    "CAR": "Clanwilliam & Lambert's Bay, Western Cape",
    "CAS": "Colesberg, Western Cape",
    "CAT": "Cradock, Western Cape",
    "CAU": "Fort Beaufort, Western Cape",
    "CAV": "Fraserburg, Western Cape",
    "CAW": "George, Western Cape",
    "CAY": "Upington, Western Cape",
    "CAZ": "Graaf",
    "CB": "Port Elizabeth, Western Cape",
    "CBA": "Hanover, Western Cape",
    "CBB": "Griquatown, Western Cape",
    "CBC": "Douglas, Western Cape",
    "CBE": "Hopetown & Strydenburg, Western Cape",
    "CBF": "Humansdorp & Jeffreys Bay, Western Cape",
    "CBG": "Jansenville, Western Cape",
    "CBH": "Kenhardt, Western Cape",
    "CBJ": "Komga, Western Cape",
    "CBK": "Kuruman, Western Cape",
    "CBL": "Ladismith, Western Cape",
    "CBM": "Laingsburg, Western Cape",
    "CBN": "Mafikeng, Western Cape",
    "CBO": "Hofmeyr, Western Cape",
    "CBP": "Middelburg, Western Cape",
    "CBR": "Montagu, Western Cape",
    "CBS": "Mossel Bay & Hartenbos, Western Cape",
    "CBT": "Murraysburg, Western Cape",
    "CBU": "Springbok, Western Cape",
    "CBV": "Pearston, Western Cape",
    "CBW": "Peddie, Western Cape",
    "CBX": "Philipstown, Petrusville & Vanderkloof, Western Cape",
    "CBY": "Piketberg, Western Cape",
    "CBZ": "Prieska, Western Cape",
    "CC": "Kimberley, Western Cape",
    "CCA": "Prince Albert, Western Cape",
    "CCB": "Richmond, Western Cape",
    "CCC": "Riverdale & Still Bay, Western Cape",
    "CCD": "Robertson & McGregor, Western Cape",
    "CCE": "Somerset East, Western Cape",
    "CCF": "Steynsburg, Western Cape",
    "CCG": "Steytlerville, Western Cape",
    "CCH": "Seymour, Western Cape",
    "CCJ": "Sutherland, Western Cape",
    "CCK": "Swellendam & Barrydale, Western Cape",
    "CCL": "Tarkastad, Western Cape",
    "CCM": "Tulbagh, Western Cape",
    "CCN": "Uitenhage & Despatch, Western Cape",
    "CCO": "Uniondale, Western Cape",
    "CCP": "Vanrhynsdorp & Klawer, Western Cape",
    "CCR": "Victoria West, Loxton & Vosburg, Western Cape",
    "CCS": "Vryburg & Reivilo, Western Cape",
    "CCT": "Willowmore, Western Cape",
    "CCU": "Dordrecht, Western Cape",
    "CCV": "Butterworth (aka Gcuwa), Western Cape (formerly Transkei)",
    "CCW": "Kokstad, Western Cape",
    "CCX": "Matatiele, Western Cape",
    "CD": "King William's Town, Western Cape",
    "CDA": "Elliot, Western Cape",
    "CDL": "Maclear, Western Cape",
    "CDX": "Middledrift, Western Cape",
    "CDZ": "Venderstad, Western Cape",
    "CE": "East London & Gonubie, Western Cape",
    "CEA": "Moorresburg, Western Cape",
    "CEB": "Kirkwood, Western Cape",
    "CEC": "Garies, Western Cape",
    "CED": "Hankey, Western Cape",
    "CEE": "Warrenton, Western Cape",
    "CEF": "Whittlesea, Western Cape",
    "CEG": "Heidelberg, Western Cape",
    "CEH": "Jamestown, Western Cape",
    "CEJ": "Lady Grey, Western Cape",
    "CEK": "Pofadder, Western Cape",
    "CEL": "Noupoort, Western Cape",
    "CEM": "Hermanus, Gans Bay, Onrus River & Stanford, Western Cape",
    "CEN": "Indwa, Western Cape",
    "CEO": "Grabouw, Western Cape",
    "CEP": "Strekstroom, Western Cape",
    "CER": "Bonnievale, Western Cape",
    "CES": "Albertinia, Western Cape",
    "CET": "Joubertine, Western Cape",
    "CEU": "Hartswater & Jan Kempdorf, Western Cape",
    "CEV": "Postmasburg & DaniÃ«lskuil, Western Cape",
    "CEW": "Olifantshoek, Sishen & Kathu, Western Cape",
    "CEX": "Porterville, Western Cape",
    "CEY": "Strand & Gordon's Bay, Western Cape",
    "CEZ": "Williston, Western Cape",
    "CF": "Grahamstown, Western Cape",
    "CFA": "Wolseley, Western Cape",
    "CFB": "Molteno, Western Cape",
    "CFC": "Stutterheim, Western Cape",
    "CFD": "Alice, Western Cape",
    "CFG": "Vredenburg & St Helena Bay, Western Cape",
    "CFH": "Kokamas, Western Cape",
    "CFK": "Keiskammahoek, Western Cape",
    "CFM": "Somerset West, Western Cape",
    "CFO": "Keimoes, Western Cape",
    "CFP": "Velddrif (formerly used for Laaiplek), Western Cape",
    "CFR": "Kuilsrivier & Brackensfel, Western Cape",
    "CFS": "Groblershoop, Western Cape",
    "CG": "Oudtshoorn, Western Cape",
    "CH": "Queenstown, Western Cape",
    "CJ": "Paarl & Franschhoek, Western Cape",
    "CK": "Malmesbury & Darling, Western Cape",
    "CL": "Stellenbosch, Western Cape",
    "CM": "De Aar, Western Cape",
    "CN": "Wellington, Western Cape",
    "CO": "Calitzdorp, Western Cape",
    "CR": "Hopefield & Langebaan, Western Cape",
    "CS": "Bredasdorp & Napier, Western Cape",
    "CT": "Ceres, Western Cape",
    "CU": "Port Nolloth, Western Cape",
    "CV": "Vredendal, Western Cape",
    "CW": "Worcester, De Doorns & Touwsrivier, Western Cape",
    "CWB": "Walvis Bay, Western Cape",
    "CX": "Knyana, Sedgefield & Plettenberg Bay, Western Cape",
    "CY": "Bellville, Durbanville & Kraaifontein, Western Cape",
    "CZ": "Beaufort West, Western Cape",
    "DK": "Rural Foundation vehicles",
    "DW": "Department of Water Affairs vehicles",
    "GAZ": "Gazankulu (formerly Ciskei) government vehicles",
    "GC": "Ciskei government vehicles",
    "GCA": "Alice, Western Cape (formerly Ciskei)",
    "GCB": "Hewu & Whittlesea, Western Cape (formerly Ciskei)",
    "GCC": "Keiskammahoek, Western Cape (formerly Ciskei)",
    "GCD": "Middledrift, Western Cape (formerly Ciskei)",
    "GCE": "Mdantsane, Western Cape (formerly Ciskei)",
    "GCF": "Peddie, Western Cape (formerly Ciskei)",
    "GCH": "Mpofu & Seymour, Western Cape (formerly Ciskei)",
    "GCJ": "Zwelitsha, Western Cape (formerly Ciskei)",
    "GCP": "Ciskei police vehicles",
    "GN": "Mhala, Limpopo? (formerly Gazankulu)",
    "GL": "Lulekani, Limpopo (formerly Gazankulu)",
    "GM": "Malamulele, Limpopo (formerly Gazankulu)",
    "GR": "Kitavi, Limpopo? (formerly Gazankulu)",
    "GY": "Giyani, Limpopo (formerly Gazankulu)",
    "KB": "Muwati, KaNgwane",
    "KC": "Nkomati, KaNgwane",
    "KD": "Nsikazi, KaNgwane",
    "KG": "KaNgwane government vehicles",
    "KNA": "Mdutjana, KwaNdebele",
    "KNB": "Mkobola, KwaNdebele",
    "KNE": "Ekangala, KwaNdebele",
    "KNF": "Vaalbank, KwaNdebele",
    "KNG": "KwaNdebele government vehicles",
    "KNK": "Kwa",
    "KNP": "KwaNdebele police vehicles",
    "KNT": "KwaNdebele Traffic Department vehicles",
    "KZN": "KwaZulu Natal council vehicles",
    "LEB": "1 ",
    "LG": "Lebowa Government",
    "LP": "Lebowa Police",
    "MD": "Department of Mining vehicles",
    "nan": "Alfred, KwaZulu Natal",
    "NB": "Bergville, KwaZulu Natal",
    "NBA": "Babanango, KwaZulu Natal",
    "NBB": "KwaZulu Natal Administration Boards vehicles",
    "NCO": "Colenso, KwaZulu Natal",
    "NCV": "Butterworth, KwaZulu Natal",
    "NCW": "Kokstad, KwaZulu Natal",
    "NCX": "Matatiele, KwaZulu Natal",
    "ND": "Durban, KwaZulu Natal",
    "NDC": "Durban council, KwaZulu Natal",
    "NDE": "Dundee, KwaZulu Natal",
    "NDH": "Dannhauser, KwaZulu Natal",
    "NDW": "Ndwedwe, KwaZulu Natal",
    "NE": "Estcourt, KwaZulu Natal",
    "NES": "Eschowe, KwaZulu Natal",
    "NF": "Msinga, KwaZulu Natal",
    "NGL": "Glencoe, KwaZulu Natal",
    "NH": "New Hanover, KwaZulu Natal",
    "NHL": "Hlabisa, KwaZulu Natal",
    "NIM": "Impendle, KwaZulu Natal",
    "NIN": "Ingwavuma, KwaZulu Natal",
    "NIP": "Polela, KwaZulu Natal",
    "NIX": "Ixopo, KwaZulu Natal",
    "NJ": "Inanda, KwaZulu Natal",
    "NK": "Richmond, KwaZulu Natal",
    "NKA": "Nkandla, KwaZulu Natal",
    "NKK": "Kranskop, KwaZulu Natal",
    "NKR": "Klip River, KwaZulu Natal",
    "NM": "Mapumulo, KwaZulu Natal",
    "NMA": "Mahlabatini, KwaZulu Natal",
    "NMG": "Magudu, KwaZulu Natal",
    "NMR": "Mooi River, KwaZulu Natal",
    "NN": "Newcastle, KwaZulu Natal",
    "NND": "Nongoma, KwaZulu Natal",
    "NO": "Mtonjaneni, KwaZulu Natal",
    "NP": "Pietermaritzburg, KwaZulu Natal",
    "NPA": "Natal Provincial Administration vehicles",
    "NPB": "Natal Parks Board vehicles",
    "NPC": "Pietermaritzburg city council, KwaZulu Natal",
    "NPN": "Pinetown, KwaZulu Natal",
    "NPNC": "Pinetown city council, KwaZulu Natal",
    "NPP": "Paulpietersburg, KwaZulu Natal",
    "NPS": "Lower Umzimkulu, KwaZulu Natal",
    "NR": "Lions River, KwaZulu Natal",
    "NRB": "Richards Bay, KwaZulu Natal",
    "NS": "Ngotshe, KwaZulu Natal",
    "NT": "Lower Tugela, KwaZulu Natal",
    "NTU": "Nqutu, KwaZulu Natal",
    "NU": "New Germany / Hillcrest, KwaZulu Natal",
    "NUB": "Ubombo, KwaZulu Natal",
    "NUD": "Underberg, KwaZulu Natal",
    "NUF": "Lower Umfolosi, KwaZulu Natal",
    "NUL": "Umbumbulu, KwaZulu Natal",
    "NUM": "Greytown, KwaZulu Natal",
    "NUR": "Umhlanga Rocks, KwaZulu Natal",
    "NUT": "Utrecht, KwaZulu Natal",
    "NUZ": "Umlazi, KwaZulu Natal",
    "NV": "Vryheid, KwaZulu Natal",
    "NX": "Scottburg (formerly Alexandria), KwaZulu Natal",
    "NZ": "Mtunzini, KwaZulu Natal",
    "OA": "Bethlehem, Free State",
    "OAB": "Reitz, Free State",
    "OAF": "Kestell, Free State",
    "OB": "Bloemfontein, Free State",
    "OBB": "Brandfort, Free State",
    "OBD": "Dewetsdorp, Free State",
    "OBG": "Reddersburg, Free State",
    "OBT": "Botshabele, Free State",
    "OBW": "Phuthadistjhaba, Free State",
    "OC": "Bethulie, Free State",
    "OCC": "Springfontein, Free State",
    "OD": "Boshoff, Free State",
    "ODB": "Hertzogville, Free State",
    "ODD": "Deslesville, Free State",
    "OE": "Edenburg, Free State",
    "OEB": "Trompsburg, Free State",
    "OF": "Fauresmith, Free State",
    "OFB": "Jagersfontein, Free State",
    "OFD": "Koffiefontein, Free State",
    "OFH": "Petrusburg, Free State",
    "OG": "Picksburg, Free State",
    "OGB": "Fouriesburg, Free State",
    "OH": "Frankfort, Free State",
    "OHB": "Villiers, Free State",
    "OHS": "Harrismith, Free State",
    "OIC": "Warden, Free State",
    "OIL": "Sasolburg, Free State",
    "OJ": "Heilbron, Free State",
    "OK": "Hoopstad, Free State",
    "OKB": "Bultfontein, Free State",
    "OKC": "Odendaalsrus, Free State",
    "OKD": "Wesselsbron, Free State",
    "OKE": "Welkom, Free State",
    "OL": "Jacobsdal, Free State",
    "OM": "Kroonstad, Free State",
    "OMB": "Bothaville, Free State",
    "OMF": "Viljoenskroon, Free State",
    "OMG": "Edenville, Free State",
    "ON": "Ladybrand, Free State",
    "ONB": "Hobhouse, Free State",
    "OND": "Clocolan, Free State",
    "OO": "Lindley, Free State",
    "OOD": "Steynsrus, Free State",
    "OOE": "Petrus Steyn, Free State",
    "OP": "Philippolis, Free State",
    "OR": "Senekal, Free State",
    "ORD": "Marquard, Free State",
    "ORE": "Paul Roux, Free State",
    "ORX": "Rouxville, Free State",
    "OS": "Smithfield, Free State",
    "OU": "Vrede, Free State",
    "OUB": "Memel, Free State",
    "OV": "Parys, Free State",
    "OVB": "Vredefort, Free State",
    "OVE": "Koppies, Free State",
    "OW": "Wepener, Free State",
    "OX": "Winburg, Free State",
    "OXD": "Theunissen, Free State",
    "OXF": "Ventersburg, Free State",
    "OXG": "Excelsior, Free State",
    "OXH": "Hennenman, Free State",
    "OXV": "Virginia, Free State",
    "OZ": "Zastron, Free State",
    "PA": "Roadworks vehicles (Padarbeid), not Cape Provincial Administration?",
    "PAO or OPA ?": "Free State Provincial Administration",
    "TA": "Benoni, Transvaal",
    "TAA": "Barberton, Transvaal",
    "TAB": "Bethal, Transvaal",
    "TAC": "Christania, Transvaal",
    "TAD": "Lichtenburg, Transvaal",
    "TAE": "Lydenburg, Transvaal",
    "TAF": "Zeerust, Transvaal",
    "TAG": "Piet Retief, Transvaal",
    "TAH": "Nylstroom, Transvaal",
    "TAI": "Wolmaranstad, Transvaal",
    "TAJ": "Louis Trichardt, Transvaal",
    "TAK": "Wolmaransad district, Transvaal",
    "TAL": "Pietersburg, Transvaal",
    "TAM": "Wakkerstroom, Transvaal",
    "TAN": "Potgietersrust, Transvaal",
    "TAO": "Ottosdal, Transvaal",
    "TAP": "Graskop, Transvaal",
    "TAQ": "Balfour, Transvaal",
    "TAR": "Messina, Transvaal",
    "TAS": "Delmas, Transvaal",
    "TAT": "Greylingstad, Transvaal",
    "TAU": "Fochville, Transvaal",
    "TAV": "Hercules, Transvaal [this was later incorporated with Pretoria]",
    "TAW": "Bronkhorstspruit, Transvaal",
    "TAX": "Rodeon, Zwartruggens, Transvaal",
    "TAY": "Randfontein, Transvaal",
    "TAZ": "Britz, Transvaal",
    "TB": "Boksburg, Transvaal",
    "TBA": "Dullstroom, Transvaal",
    "TBB": "Leeudoornstad, Transvaal",
    "TBC": "Tzaneen, Transvaal",
    "TBD": "Duivelskloof, Transvaal",
    "TBE": "Delareyville, Transvaal",
    "TBF": "Hendrina, Transvaal",
    "TBG": "Charl Cilliers, Transvaal",
    "TBH": "Nelspruit, Transvaal",
    "TBI": "Koster, Transvaal",
    "TBJ": "Trichard, Transvaal",
    "TBK": "Morgenzon, Transvaal",
    "TBL": "Machadodorp, Transvaal",
    "TBM": "Breyton, Transvaal",
    "TBS": "Sabie, Transvaal",
    "TBZ": "Thabazimbi, Transvaal",
    "TC": "Carolina, Transvaal",
    "TCA": "Groblersdaal, Transvaal",
    "TCB": "Belfast, Transvaal",
    "TCC": "Coligny, Transvaal",
    "TCD": "Kempton Park, Transvaal",
    "TCE": "Venterspost, Transvaal",
    "TCX": "Maquassi, Transvaal",
    "TDD": "Pilgrims Rest, Transvaal",
    "TDG": "Nigel, Transvaal",
    "TDH": "Witrivier, Transvaal",
    "TDJ": "Leslie, Transvaal",
    "TDK": "Alberton, Transvaal",
    "TDL": "Edenvale, Transvaal",
    "TE": "Ermelo, Transvaal",
    "TEA": "Amsterdam, Transvaal",
    "TF": "Amersfoort, Transvaal",
    "TG": "Germiston, Transvaal",
    "TH": "Heidelberg, Transvaal",
    "TI": "Rustenburg, Transvaal",
    "TJ": "Johannesburg, Transvaal",
    "TK": "Krugersdorp, Transvaal",
    "TL": "Bloemhof, Transvaal",
    "TM": "Middleburg, Transvaal",
    "TN": "Ventersdorp, Transvaal",
    "TNS": "Naboomspruit, Transvaal",
    "TO": "Brakpan, Transvaal",
    "TP": "Pretoria, Transvaal",
    "TQ": "Standerton, Transvaal",
    "TR": "Schweizer",
    "TS": "Springs, Transvaal",
    "TSN": "Sandton, Transvaal",
    "TT": "Volksrust, Transvaal",
    "TU": "Roodepoort",
    "TV": "Vereeniging, Transvaal",
    "TVB": "Van Der Bijl Park, Transvaal",
    "TW": "Witbank, Transvaal",
    "TWB": "Warmbaths, Transvaal",
    "TX": "Potchefstroom, Transvaal",
    "TY": "Klerksdorp, Transvaal",
    "TZ": "Klerksdorp district, Transvaal",
    "V": "D ",
    "VDF": "Venda Defence Force vehicles",
    "VM": "Venda government vehicles",
    "VP": "Venda Police",
    "VTA": "Venda Traffic Administration vehicles",
    "VV": "Dzanani, Mutale, Sibasa & Vuwani, Venda",
    "WR": "Qwaqwa Government vehicles",
    "XA": "Umtata, Western Cape (formerly Transkei)",
    "XAA": "Nqamake, Western Cape (formerly Transkei)",
    "XAB": "Tabankulu, Western Cape (formerly Transkei)",
    "XAC": "Tsomo, Western Cape (formerly Transkei)",
    "XAD": "Xhora, Western Cape (formerly Transkei)",
    "XAE": "Mqanduli, Western Cape (formerly Transkei)",
    "XAF": "Bizana, Western Cape (formerly Transkei)",
    "XAG": "Gatyana, Western Cape (formerly Transkei)",
    "XAH": "Siphaqeni, Western Cape (formerly Transkei)",
    "XB": "Gcuwa (aka Butterworth), Western Cape (formerly Transkei)",
    "XC": "Lusikisiki, Western Cape (formerly Transkei)",
    "XD": "Cofimvaba, Western Cape (formerly Transkei)",
    "XE": "Engcobo, Western Cape (formerly Transkei)",
    "XF": "Umzimvubu, Western Cape (formerly Transkei)",
    "XG": "Transkei government vehicles",
    "XGA": "Agriculture & Forestry Dept vehicles",
    "XGC": "Commerce, Industry & Tourism Dept vehicles",
    "XGH": "Health & Welfare Dept vehicles",
    "XGL": "Local Government & Land Tenure Dept vehicles",
    "XGW": "Works & Energy Dept vehicles",
    "XH": "Umzimkulu, Western Cape (formerly Transkei)",
    "XJ": "Maxesibeni, Western Cape (formerly Transkei)",
    "XK": "Kwabhaca, Western Cape (formerly Transkei)",
    "XL": "Matatiele, Western Cape (formerly Transkei)",
    "XM": "Transkei Army vehicles",
    "XN": "Idutywa, Western Cape (formerly Transkei)",
    "XO": "Tsolo, Western Cape (formerly Transkei)",
    "XP": "Transkei police vehicles",
    "XPT": "Transkei Traffic Police vehicles",
    "XR": "Cacadu, Western Cape (formerly Transkei)",
    "XRT": "Transkei Road Transport Services vehicles",
    "XS": "Xalanga, Western Cape (formerly Transkei)",
    "XT": "Herschel, Western Cape (formerly Transkei)",
    "XU": "Libode, Western Cape (formerly Transkei)",
    "XV": "Qumbu, Western Cape (formerly Transkei)",
    "XW": "Mt Fletcher, Western Cape (formerly Transkei)",
    "XY": "Centane, Western Cape (formerly Transkei)",
    "XZ": "Ngqeleni, Western Cape (formerly Transkei)",
    "YB": "Bophuthatswana government vehicles",
    "YBA": "Molopo, formerly Bophuthatswana",
    "YBB": "Odi, formerly Bophuthatswana",
    "YBC": "Moretele, formerly Bophuthatswana",
    "YBD": "Hafekeng & Tlhabane, formerly Bophuthatswana",
    "YBE": "Ditsobotla, formerly Bophuthatswana",
    "YBG": "Lehurutshe, formerly Bophuthatswana",
    "YBH": "Tlhaping",
    "YBJ": "Madikwe, formerly Bophuthatswana",
    "YBK": "Thaba 'Nchu, formerly Bophuthatswana",
    "YBL": "Mankwe, formerly Bophuthatswana",
    "YBM": "Ganyesa, formerly Bophuthatswana",
    "YBN": "Taung, formerly Bophuthatswana",
    "YBP": "Bophuthatswana police vehicles",
    "YBX": "Mabopane, formerly Bophuthatswana",
    "ZG": "Kwazulu (formerly Zululand) government vehicles",
    "ZK": "Kwazulu (formerly Zululand) Paramount Chief vehicles",
    "ZP": "Kwazulu (formerly Zululand) police vehicles",
    "Z_": "Kwazulu (formerly Zululand)"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'South African Number Plate Scanner',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              shape: BoxShape.rectangle,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Image.asset(
                          'assets/images/Coat_of_arms_of_South_Africa.svg.png',
                          width: 150,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: SelectionArea(
                              child: Text(
                            'an application to fetch the town/city of any given South African number plate',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Product Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                        child: FlutterFlowDropDown(
                          //set options to keys of the map CarData
                          options: CarData.keys.toList(),
                          onChanged: (val) {
                            setState(() => dropDownValue = CarData[val]);
                            fetchCityData(dropDownValue);
                            print('dropDownValue: $dropDownValue');
                          },
                          width: double.infinity,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Product Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                useGoogleFonts: false,
                              ),
                          hintText:
                              'To get started enter the number plate code',
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    child: SingleChildScrollView(
                      child: _loading == true
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: // render image if Result['imageurl'] is a valid url
                                      Image.network(
                                    Result['imageurl'],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Text(
                                        '',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Product Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: false,
                                            ),
                                      );
                                    },
                                    //set width to the width of the screen
                                    width: MediaQuery.of(context).size.width,
                                    height: 500,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SelectionArea(
                                    child: Text(
                                  Result['info'],
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                )),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
