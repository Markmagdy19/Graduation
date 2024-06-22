class ArticleDetails {
  PubmedArticleSet? pubmedArticleSet;

  ArticleDetails({this.pubmedArticleSet});

  ArticleDetails.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        pubmedArticleSet = json['PubmedArticleSet'] != null
            ? new PubmedArticleSet.fromJson(json['PubmedArticleSet'])
            : null;
      }
    } catch (e) {
      print('Error parsing ArticleDetails: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubmedArticleSet != null) {
      data['PubmedArticleSet'] = this.pubmedArticleSet!.toJson();
    }
    return data;
  }
}

class PubmedArticleSet {
  PubmedArticle? pubmedArticle;

  PubmedArticleSet({this.pubmedArticle});

  PubmedArticleSet.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        pubmedArticle = json['PubmedArticle'] != null
            ? new PubmedArticle.fromJson(json['PubmedArticle'])
            : null;
      }
    } catch (e) {
      print('Error parsing PubmedArticleSet: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubmedArticle != null) {
      data['PubmedArticle'] = this.pubmedArticle!.toJson();
    }
    return data;
  }
}

class PubmedArticle {
  MedlineCitation? medlineCitation;
  PubmedData? pubmedData;

  PubmedArticle({this.medlineCitation, this.pubmedData});

  PubmedArticle.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        medlineCitation = json['MedlineCitation'] != null
            ? new MedlineCitation.fromJson(json['MedlineCitation'])
            : null;
        pubmedData = json['PubmedData'] != null
            ? new PubmedData.fromJson(json['PubmedData'])
            : null;
      }
    } catch (e) {
      print('Error parsing PubmedArticle: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medlineCitation != null) {
      data['MedlineCitation'] = this.medlineCitation!.toJson();
    }
    if (this.pubmedData != null) {
      data['PubmedData'] = this.pubmedData!.toJson();
    }
    return data;
  }
}

class MedlineCitation {
  PMID? pMID;
  DateCompleted? dateCompleted;
  DateCompleted? dateRevised;
  Article? article;
  MedlineJournalInfo? medlineJournalInfo;
  ChemicalList? chemicalList;
  String? citationSubset;
  MeshHeadingList? meshHeadingList;
  KeywordList? keywordList;
  String? coiStatement;
  String? sStatus;
  String? sOwner;
  String? sIndexingMethod;

  MedlineCitation(
      {this.pMID,
      this.dateCompleted,
      this.dateRevised,
      this.article,
      this.medlineJournalInfo,
      this.chemicalList,
      this.citationSubset,
      this.meshHeadingList,
      this.keywordList,
      this.coiStatement,
      this.sStatus,
      this.sOwner,
      this.sIndexingMethod});

  MedlineCitation.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        pMID = json['PMID'] != null ? new PMID.fromJson(json['PMID']) : null;
        dateCompleted = json['DateCompleted'] != null
            ? new DateCompleted.fromJson(json['DateCompleted'])
            : null;
        dateRevised = json['DateRevised'] != null
            ? new DateCompleted.fromJson(json['DateRevised'])
            : null;
        article = json['Article'] != null
            ? new Article.fromJson(json['Article'])
            : null;
        medlineJournalInfo = json['MedlineJournalInfo'] != null
            ? new MedlineJournalInfo.fromJson(json['MedlineJournalInfo'])
            : null;
        chemicalList = json['ChemicalList'] != null
            ? new ChemicalList.fromJson(json['ChemicalList'])
            : null;
        citationSubset = json['CitationSubset'].toString();
        meshHeadingList = json['MeshHeadingList'] != null
            ? new MeshHeadingList.fromJson(json['MeshHeadingList'])
            : null;
        keywordList = json['KeywordList'] != null
            ? new KeywordList.fromJson(json['KeywordList'])
            : null;
        coiStatement = json['CoiStatement'].toString();
        sStatus = json['_Status'].toString();
        sOwner = json['_Owner'].toString();
        sIndexingMethod = json['_IndexingMethod'].toString();
      }
    } catch (e) {
      print('Error parsing MedlineCitation: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pMID != null) {
      data['PMID'] = this.pMID!.toJson();
    }
    if (this.dateCompleted != null) {
      data['DateCompleted'] = this.dateCompleted!.toJson();
    }
    if (this.dateRevised != null) {
      data['DateRevised'] = this.dateRevised!.toJson();
    }
    if (this.article != null) {
      data['Article'] = this.article!.toJson();
    }
    if (this.medlineJournalInfo != null) {
      data['MedlineJournalInfo'] = this.medlineJournalInfo!.toJson();
    }
    if (this.chemicalList != null) {
      data['ChemicalList'] = this.chemicalList!.toJson();
    }
    data['CitationSubset'] = this.citationSubset;
    if (this.meshHeadingList != null) {
      data['MeshHeadingList'] = this.meshHeadingList!.toJson();
    }
    if (this.keywordList != null) {
      data['KeywordList'] = this.keywordList!.toJson();
    }
    data['CoiStatement'] = this.coiStatement;
    data['_Status'] = this.sStatus;
    data['_Owner'] = this.sOwner;
    data['_IndexingMethod'] = this.sIndexingMethod;
    return data;
  }
}

class PMID {
  String? sVersion;
  String? sText;

  PMID({this.sVersion, this.sText});

  PMID.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sVersion = json['_Version'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing PMID: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_Version'] = this.sVersion;
    data['__text'] = this.sText;
    return data;
  }
}

class DateCompleted {
  String? year;
  String? month;
  String? day;

  DateCompleted({this.year, this.month, this.day});

  DateCompleted.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        year = json['Year'].toString();
        month = json['Month'].toString();
        day = json['Day'].toString();
      }
    } catch (e) {
      print('Error parsing DateCompleted: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    return data;
  }
}

class Article {
  Journal? journal;
  String? articleTitle;
  Pagination? pagination;
  List<ELocationID>? eLocationID;
  Abstract? abstract;
  AuthorList? authorList;
  String? language;
  PublicationTypeList? publicationTypeList;
  ArticleDate? articleDate;
  String? sPubModel;

  Article(
      {this.journal,
      this.articleTitle,
      this.pagination,
      this.eLocationID,
      this.abstract,
      this.authorList,
      this.language,
      this.publicationTypeList,
      this.articleDate,
      this.sPubModel});

  Article.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        journal = json['Journal'] != null
            ? new Journal.fromJson(json['Journal'])
            : null;
        articleTitle = json['ArticleTitle'].toString();
        pagination = json['Pagination'] != null
            ? new Pagination.fromJson(json['Pagination'])
            : null;
        if (json['ELocationID'] != null) {
          eLocationID = <ELocationID>[];
          json['ELocationID'].forEach((v) {
            eLocationID!.add(new ELocationID.fromJson(v));
          });
        }
        abstract = json['Abstract'] != null
            ? new Abstract.fromJson(json['Abstract'])
            : null;
        authorList = json['AuthorList'] != null
            ? new AuthorList.fromJson(json['AuthorList'])
            : null;
        language = json['Language'].toString();
        publicationTypeList = json['PublicationTypeList'] != null
            ? new PublicationTypeList.fromJson(json['PublicationTypeList'])
            : null;
        articleDate = json['ArticleDate'] != null
            ? new ArticleDate.fromJson(json['ArticleDate'])
            : null;
        sPubModel = json['_PubModel'].toString();
      }
    } catch (e) {
      print('Error parsing Article: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.journal != null) {
      data['Journal'] = this.journal!.toJson();
    }
    data['ArticleTitle'] = this.articleTitle;
    if (this.pagination != null) {
      data['Pagination'] = this.pagination!.toJson();
    }
    if (this.eLocationID != null) {
      data['ELocationID'] = this.eLocationID!.map((v) => v.toJson()).toList();
    }
    if (this.abstract != null) {
      data['Abstract'] = this.abstract!.toJson();
    }
    if (this.authorList != null) {
      data['AuthorList'] = this.authorList!.toJson();
    }
    data['Language'] = this.language;
    if (this.publicationTypeList != null) {
      data['PublicationTypeList'] = this.publicationTypeList!.toJson();
    }
    if (this.articleDate != null) {
      data['ArticleDate'] = this.articleDate!.toJson();
    }
    data['_PubModel'] = this.sPubModel;
    return data;
  }
}

class Journal {
  ISSN? iSSN;
  JournalIssue? journalIssue;
  String? title;
  String? iSOAbbreviation;

  Journal({this.iSSN, this.journalIssue, this.title, this.iSOAbbreviation});

  Journal.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        iSSN = json['ISSN'] != null ? new ISSN.fromJson(json['ISSN']) : null;
        journalIssue = json['JournalIssue'] != null
            ? new JournalIssue.fromJson(json['JournalIssue'])
            : null;
        title = json['Title'].toString();
        iSOAbbreviation = json['ISOAbbreviation'].toString();
      }
    } catch (e) {
      print('Error parsing Journal: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iSSN != null) {
      data['ISSN'] = this.iSSN!.toJson();
    }
    if (this.journalIssue != null) {
      data['JournalIssue'] = this.journalIssue!.toJson();
    }
    data['Title'] = this.title;
    data['ISOAbbreviation'] = this.iSOAbbreviation;
    return data;
  }
}

class ISSN {
  String? sIssnType;
  String? sText;

  ISSN({this.sIssnType, this.sText});

  ISSN.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sIssnType = json['_IssnType'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing ISSN: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_IssnType'] = this.sIssnType;
    data['__text'] = this.sText;
    return data;
  }
}

class JournalIssue {
  String? volume;
  String? issue;
  DateCompleted? pubDate;
  String? sCitedMedium;

  JournalIssue({this.volume, this.issue, this.pubDate, this.sCitedMedium});

  JournalIssue.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        volume = json['Volume'].toString();
        issue = json['Issue'].toString();
        pubDate = json['PubDate'] != null
            ? new DateCompleted.fromJson(json['PubDate'])
            : null;
        sCitedMedium = json['_CitedMedium'].toString();
      }
    } catch (e) {
      print('Error parsing JournalIssue: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Volume'] = this.volume;
    data['Issue'] = this.issue;
    if (this.pubDate != null) {
      data['PubDate'] = this.pubDate!.toJson();
    }
    data['_CitedMedium'] = this.sCitedMedium;
    return data;
  }
}

class Pagination {
  String? startPage;
  String? medlinePgn;

  Pagination({this.startPage, this.medlinePgn});

  Pagination.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        startPage = json['StartPage'].toString();
        medlinePgn = json['MedlinePgn'].toString();
      }
    } catch (e) {
      print('Error parsing Pagination: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StartPage'] = this.startPage;
    data['MedlinePgn'] = this.medlinePgn;
    return data;
  }
}

class ELocationID {
  String? sEIdType;
  String? sValidYN;
  String? sText;

  ELocationID({this.sEIdType, this.sValidYN, this.sText});

  ELocationID.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sEIdType = json['_EIdType'].toString();
        sValidYN = json['_ValidYN'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing ELocationID: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_EIdType'] = this.sEIdType;
    data['_ValidYN'] = this.sValidYN;
    data['__text'] = this.sText;
    return data;
  }
}

class Abstract {
  String? abstractText;

  Abstract({this.abstractText});

  Abstract.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        abstractText = json['AbstractText'].toString();
      }
    } catch (e) {
      print('Error parsing Abstract: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AbstractText'] = this.abstractText;
    return data;
  }
}

class AuthorList {
  List<Author>? author;
  String? sCompleteYN;

  AuthorList({this.author, this.sCompleteYN});

  AuthorList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['Author'] != null) {
          author = <Author>[];
          json['Author'].forEach((v) {
            author!.add(new Author.fromJson(v));
          });
        }
        sCompleteYN = json['_CompleteYN'].toString();
      }
    } catch (e) {
      print('Error parsing AuthorList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['Author'] = this.author!.map((v) => v.toJson()).toList();
    }
    data['_CompleteYN'] = this.sCompleteYN;
    return data;
  }
}

class Author {
  String? lastName;
  String? foreName;
  String? initials;
  AffiliationInfo? affiliationInfo;
  String? sValidYN;
  Identifier? identifier;

  Author(
      {this.lastName,
      this.foreName,
      this.initials,
      this.affiliationInfo,
      this.sValidYN,
      this.identifier});

  Author.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        lastName = json['LastName'].toString();
        foreName = json['ForeName'].toString();
        initials = json['Initials'].toString();
        affiliationInfo = json['AffiliationInfo'] != null
            ? new AffiliationInfo.fromJson(json['AffiliationInfo'])
            : null;
        sValidYN = json['_ValidYN'].toString();
        identifier = json['Identifier'] != null
            ? new Identifier.fromJson(json['Identifier'])
            : null;
      }
    } catch (e) {
      print('Error parsing Author: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastName'] = this.lastName;
    data['ForeName'] = this.foreName;
    data['Initials'] = this.initials;
    if (this.affiliationInfo != null) {
      data['AffiliationInfo'] = this.affiliationInfo!.toJson();
    }
    data['_ValidYN'] = this.sValidYN;
    if (this.identifier != null) {
      data['Identifier'] = this.identifier!.toJson();
    }
    return data;
  }
}

class AffiliationInfo {
  String? affiliation;

  AffiliationInfo({this.affiliation});

  AffiliationInfo.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        affiliation = json['Affiliation'].toString();
      }
    } catch (e) {
      print('Error parsing AffiliationInfo: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Affiliation'] = this.affiliation;
    return data;
  }
}

class Identifier {
  String? sSource;
  String? sText;

  Identifier({this.sSource, this.sText});

  Identifier.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sSource = json['_Source'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing Identifier: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_Source'] = this.sSource;
    data['__text'] = this.sText;
    return data;
  }
}

class PublicationTypeList {
  List<PublicationType>? publicationType;

  PublicationTypeList({this.publicationType});

  PublicationTypeList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['PublicationType'] != null) {
          publicationType = <PublicationType>[];
          json['PublicationType'].forEach((v) {
            publicationType!.add(new PublicationType.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing PublicationTypeList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.publicationType != null) {
      data['PublicationType'] =
          this.publicationType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PublicationType {
  String? sUI;
  String? sText;

  PublicationType({this.sUI, this.sText});

  PublicationType.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sUI = json['_UI'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing PublicationType: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data['__text'] = this.sText;
    return data;
  }
}

class ArticleDate {
  String? year;
  String? month;
  String? day;
  String? sDateType;

  ArticleDate({this.year, this.month, this.day, this.sDateType});

  ArticleDate.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        year = json['Year'].toString();
        month = json['Month'].toString();
        day = json['Day'].toString();
        sDateType = json['_DateType'].toString();
      }
    } catch (e) {
      print('Error parsing ArticleDate: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    data['_DateType'] = this.sDateType;
    return data;
  }
}

class MedlineJournalInfo {
  String? country;
  String? medlineTA;
  String? nlmUniqueID;
  String? iSSNLinking;

  MedlineJournalInfo(
      {this.country, this.medlineTA, this.nlmUniqueID, this.iSSNLinking});

  MedlineJournalInfo.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        country = json['Country'].toString();
        medlineTA = json['MedlineTA'].toString();
        nlmUniqueID = json['NlmUniqueID'].toString();
        iSSNLinking = json['ISSNLinking'].toString();
      }
    } catch (e) {
      print('Error parsing MedlineJournalInfo: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['MedlineTA'] = this.medlineTA;
    data['NlmUniqueID'] = this.nlmUniqueID;
    data['ISSNLinking'] = this.iSSNLinking;
    return data;
  }
}

class ChemicalList {
  List<Chemical>? chemical;

  ChemicalList({this.chemical});

  ChemicalList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['Chemical'] != null) {
          chemical = <Chemical>[];
          json['Chemical'].forEach((v) {
            chemical!.add(new Chemical.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing ChemicalList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chemical != null) {
      data['Chemical'] = this.chemical!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chemical {
  String? registryNumber;
  PublicationType? nameOfSubstance;

  Chemical({this.registryNumber, this.nameOfSubstance});

  Chemical.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        registryNumber = json['RegistryNumber'].toString();
        nameOfSubstance = json['NameOfSubstance'] != null
            ? new PublicationType.fromJson(json['NameOfSubstance'])
            : null;
      }
    } catch (e) {
      print('Error parsing Chemical: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RegistryNumber'] = this.registryNumber;
    if (this.nameOfSubstance != null) {
      data['NameOfSubstance'] = this.nameOfSubstance!.toJson();
    }
    return data;
  }
}

class MeshHeadingList {
  List<MeshHeading>? meshHeading;

  MeshHeadingList({this.meshHeading});

  MeshHeadingList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['MeshHeading'] != null) {
          meshHeading = <MeshHeading>[];
          json['MeshHeading'].forEach((v) {
            meshHeading!.add(new MeshHeading.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing MeshHeadingList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meshHeading != null) {
      data['MeshHeading'] = this.meshHeading!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeshHeading {
  DescriptorName? descriptorName;
  DescriptorName? qualifierName;

  MeshHeading({this.descriptorName, this.qualifierName});

  MeshHeading.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        descriptorName = json['DescriptorName'] != null
            ? new DescriptorName.fromJson(json['DescriptorName'])
            : null;
        qualifierName = json['QualifierName'] != null
            ? new DescriptorName.fromJson(json['QualifierName'])
            : null;
      }
    } catch (e) {
      print('Error parsing MeshHeading: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.descriptorName != null) {
      data['DescriptorName'] = this.descriptorName!.toJson();
    }
    if (this.qualifierName != null) {
      data['QualifierName'] = this.qualifierName!.toJson();
    }
    return data;
  }
}

class DescriptorName {
  String? sUI;
  String? sMajorTopicYN;
  String? sText;

  DescriptorName({this.sUI, this.sMajorTopicYN, this.sText});

  DescriptorName.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sUI = json['_UI'].toString();
        sMajorTopicYN = json['_MajorTopicYN'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing DescriptorName: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_UI'] = this.sUI;
    data['_MajorTopicYN'] = this.sMajorTopicYN;
    data['__text'] = this.sText;
    return data;
  }
}

class KeywordList {
  List<Keyword>? keyword;
  String? sOwner;

  KeywordList({this.keyword, this.sOwner});

  KeywordList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['Keyword'] != null) {
          keyword = <Keyword>[];
          json['Keyword'].forEach((v) {
            keyword!.add(new Keyword.fromJson(v));
          });
        }
        sOwner = json['_Owner'].toString();
      }
    } catch (e) {
      print('Error parsing KeywordList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.keyword != null) {
      data['Keyword'] = this.keyword!.map((v) => v.toJson()).toList();
    }
    data['_Owner'] = this.sOwner;
    return data;
  }
}

class Keyword {
  String? sMajorTopicYN;
  String? sText;

  Keyword({this.sMajorTopicYN, this.sText});

  Keyword.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sMajorTopicYN = json['_MajorTopicYN'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing Keyword: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_MajorTopicYN'] = this.sMajorTopicYN;
    data['__text'] = this.sText;
    return data;
  }
}

class PubmedData {
  History? history;
  String? publicationStatus;
  ArticleIdList? articleIdList;
  ReferenceList? referenceList;

  PubmedData(
      {this.history,
      this.publicationStatus,
      this.articleIdList,
      this.referenceList});

  PubmedData.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        history = json['History'] != null
            ? new History.fromJson(json['History'])
            : null;
        publicationStatus = json['PublicationStatus'].toString();
        articleIdList = json['ArticleIdList'] != null
            ? new ArticleIdList.fromJson(json['ArticleIdList'])
            : null;
        referenceList = json['ReferenceList'] != null
            ? new ReferenceList.fromJson(json['ReferenceList'])
            : null;
      }
    } catch (e) {
      print('Error parsing PubmedData: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['History'] = this.history!.toJson();
    }
    data['PublicationStatus'] = this.publicationStatus;
    if (this.articleIdList != null) {
      data['ArticleIdList'] = this.articleIdList!.toJson();
    }
    if (this.referenceList != null) {
      data['ReferenceList'] = this.referenceList!.toJson();
    }
    return data;
  }
}

class History {
  List<PubMedPubDate>? pubMedPubDate;

  History({this.pubMedPubDate});

  History.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['PubMedPubDate'] != null) {
          pubMedPubDate = <PubMedPubDate>[];
          json['PubMedPubDate'].forEach((v) {
            pubMedPubDate!.add(new PubMedPubDate.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing History: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pubMedPubDate != null) {
      data['PubMedPubDate'] =
          this.pubMedPubDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PubMedPubDate {
  String? year;
  String? month;
  String? day;
  String? hour;
  String? minute;
  String? sPubStatus;

  PubMedPubDate(
      {this.year,
      this.month,
      this.day,
      this.hour,
      this.minute,
      this.sPubStatus});

  PubMedPubDate.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        year = json['Year'].toString();
        month = json['Month'].toString();
        day = json['Day'].toString();
        hour = json['Hour'].toString();
        minute = json['Minute'].toString();
        sPubStatus = json['_PubStatus'].toString();
      }
    } catch (e) {
      print('Error parsing PubMedPubDate: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.year;
    data['Month'] = this.month;
    data['Day'] = this.day;
    data['Hour'] = this.hour;
    data['Minute'] = this.minute;
    data['_PubStatus'] = this.sPubStatus;
    return data;
  }
}

class ArticleIdList {
  List<ArticleId>? articleId;

  ArticleIdList({this.articleId});

  ArticleIdList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['ArticleId'] != null) {
          articleId = <ArticleId>[];
          json['ArticleId'].forEach((v) {
            articleId!.add(new ArticleId.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing ArticleIdList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articleId != null) {
      data['ArticleId'] = this.articleId!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleId {
  String? sIdType;
  String? sText;

  ArticleId({this.sIdType, this.sText});

  ArticleId.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        sIdType = json['_IdType'].toString();
        sText = json['__text'].toString();
      }
    } catch (e) {
      print('Error parsing ArticleId: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_IdType'] = this.sIdType;
    data['__text'] = this.sText;
    return data;
  }
}

class ReferenceList {
  List<Reference>? reference;

  ReferenceList({this.reference});

  ReferenceList.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        if (json['Reference'] != null) {
          reference = <Reference>[];
          json['Reference'].forEach((v) {
            reference!.add(new Reference.fromJson(v));
          });
        }
      }
    } catch (e) {
      print('Error parsing ReferenceList: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reference != null) {
      data['Reference'] = this.reference!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reference {
  String? citation;
  ArticleIdList? articleIdList;

  Reference({this.citation, this.articleIdList});

  Reference.fromJson(dynamic json) {
    try {
      if (json is Map<String, dynamic>) {
        citation = json['Citation'].toString();
        articleIdList = json['ArticleIdList'] != null
            ? new ArticleIdList.fromJson(json['ArticleIdList'])
            : null;
      }
    } catch (e) {
      print('Error parsing Reference: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Citation'] = this.citation;
    if (this.articleIdList != null) {
      data['ArticleIdList'] = this.articleIdList!.toJson();
    }
    return data;
  }
}
