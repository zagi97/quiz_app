import 'package:flutter/material.dart';


import 'package:adv_basics/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    //COLUMN-> column u kojemu su svi smješteni widgeti (Row i Column)
    //ROW   -> row u kojemu imamo indexe pitanja te smješten novi Column Widget
    //COLUMN-> column u kojemu imamo smještene tri varijable (pitanja, odgovor korisnika i točni odgovor)
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          //MAKSIMALAN HEIGHT
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
