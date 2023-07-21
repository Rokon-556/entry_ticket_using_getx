import 'dart:convert';

MyTickets myTicketsFromJson(String str) => MyTickets.fromJson(json.decode(str));

String myTicketsToJson(MyTickets data) => json.encode(data.toJson());

class MyTickets {
    List<TicketItem>? items;
    bool? hasMore;
    int? limit;
    int? offset;
    int? count;
    List<Link>? links;

    MyTickets({
        this.items,
        this.hasMore,
        this.limit,
        this.offset,
        this.count,
        this.links,
    });

    factory MyTickets.fromJson(Map<String, dynamic> json) => MyTickets(
        items: json["items"] == null ? [] : List<TicketItem>.from(json["items"]!.map((x) => TicketItem.fromJson(x))),
        hasMore: json["hasMore"],
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "hasMore": hasMore,
        "limit": limit,
        "offset": offset,
        "count": count,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    };
}

class TicketItem {
    int? pk;
    int? iteminfoFk;
    int? tslmsFk;
    String? dsc;
    int? tp;
    int? mrp;
    int? qty;
    int? discount;
    double? vat;
    int? bunitFk;
    int? isCombo;
    String? appAvail;
    String? msmasteridOffersid;

    TicketItem({
        this.pk,
        this.iteminfoFk,
        this.tslmsFk,
        this.dsc,
        this.tp,
        this.mrp,
        this.qty,
        this.discount,
        this.vat,
        this.bunitFk,
        this.isCombo,
        this.appAvail,
        this.msmasteridOffersid,
    });

    factory TicketItem.fromJson(Map<String, dynamic> json) => TicketItem(
        pk: json["pk"],
        iteminfoFk: json["iteminfo_fk"],
        tslmsFk: json["tslms_fk"],
        dsc: json["dsc"],
        tp: json["tp"],
        mrp: json["mrp"],
        qty: json["qty"],
        discount: json["discount"],
        vat: json["vat"]?.toDouble(),
        bunitFk: json["bunit_fk"],
        isCombo: json["is_combo"],
        appAvail: json["app_avail"],
        msmasteridOffersid: json["msmasterid_offersid"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "iteminfo_fk": iteminfoFk,
        "tslms_fk": tslmsFk,
        "dsc": dsc,
        "tp": tp,
        "mrp": mrp,
        "qty": qty,
        "discount": discount,
        "vat": vat,
        "bunit_fk": bunitFk,
        "is_combo": isCombo,
        "app_avail": appAvail,
        "msmasterid_offersid": msmasteridOffersid,
    };
}

class Link {
    String? rel;
    String? href;

    Link({
        this.rel,
        this.href,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
    };
}
