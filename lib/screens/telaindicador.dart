import 'package:flutter/material.dart';
import 'package:flutter_datachamp/models/cotacaoo.dart';
import 'package:flutter_datachamp/models/indicadorr.dart';
import 'package:flutter_datachamp/widgets/grafic_widget.dart';
// ignore: depend_on_referenced_packages
import "package:intl/intl.dart";


class IndicadorScreen extends StatefulWidget { 
  const IndicadorScreen({Key? key}) : super(key: key);

  @override
  _IndicadorScreenState createState() => _IndicadorScreenState();
}

class _IndicadorScreenState extends State<IndicadorScreen>{
  List<Indicador> indicadores = [];
  List<Cotacao> cotacoes = [];
  List<String> diasDoMes = List.generate(30, (index) => (index + 1).toString());

  int nextIndicadorId = 1;
  int nextCotacaoId = 1;

  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  Indicador? selectedIndicador;

  String selectedIndicadorMessage = 'Selecione um Indicador';

  Map<Indicador, List<Cotacao>> grupoCotacoesIndicador(List<Cotacao> cotacoes){
    Map<Indicador, List<Cotacao>> grupoIndicador = {};

    for(var cotacao in cotacoes) {
      if (!grupoIndicador.containsKey(cotacao.indicador)){
        grupoIndicador[cotacao.indicador] = [];
      }
      grupoIndicador[cotacao.indicador]!.add(cotacao);
    }
    return grupoIndicador;
  }
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    var Euro = Indicador(id: 1, descricao: "Euro");
    var Real = Indicador(id: 2, descricao: "Real");
    var Dolar = Indicador(id: 3, descricao: "Dolar");
    var Libra = Indicador(id: 4, descricao: "Libra");
    var Peso = Indicador(id: 5, descricao: "Peso");

    final cotacaoEuro =
     Cotacao(id: 1, dataHora: DateTime.now(), valor: 5, indicador: Euro,);
    final cotacaoEuro2 =
     Cotacao(id: 2, dataHora: DateTime.now(), valor: 5.2, indicador: Euro,);
    final cotacaoEuro3 =
     Cotacao(id: 3, dataHora: DateTime.now(), valor: 3, indicador: Euro,);
    final cotacaoEuro4 =
     Cotacao(id: 4, dataHora: DateTime.now(), valor: 4, indicador: Euro,);
    final cotacaoEuro5 =
     Cotacao(id: 5, dataHora: DateTime.now(), valor: 4.50, indicador: Euro,);


    final cotacaoReal =
     Cotacao(id: 6, dataHora: DateTime.now(), valor: 7, indicador: Real,);
    final cotacaoReal2 =
     Cotacao(id: 7, dataHora: DateTime.now(), valor: 4.50, indicador: Real,);
    final cotacaoReal3 =
     Cotacao(id: 8, dataHora: DateTime.now(), valor: 8, indicador: Real,);
    final cotacaoReal4 =
     Cotacao(id: 9, dataHora: DateTime.now(), valor: 7.50, indicador: Real,);
    final cotacaoReal5 = 
     Cotacao(id: 10, dataHora: DateTime.now(), valor: 7.78, indicador: Real,);


    final cotacaoDolar =
     Cotacao(id: 11, dataHora: DateTime.now(), valor: 1, indicador: Dolar,);
    final cotacaoDolar2 =
     Cotacao(id: 12, dataHora: DateTime.now(), valor: 3.86, indicador: Dolar,);
    final cotacaoDolar3 =
     Cotacao(id: 13, dataHora: DateTime.now(), valor: 2, indicador: Dolar,);
    final cotacaoDolar4 = 
     Cotacao(id: 14, dataHora: DateTime.now(), valor: 6, indicador: Dolar,);
    final cotacaoDolar5 =
     Cotacao(id: 15, dataHora: DateTime.now(), valor: 6.58, indicador: Dolar,);


    final cotacaoLibra = 
     Cotacao(id: 16, dataHora: DateTime.now(), valor: 6, indicador: Libra,);
    final cotacaoLibra2 = 
     Cotacao(id: 17, dataHora: DateTime.now(), valor: 4.49, indicador: Libra,);
    final cotacaoLibra3 =
     Cotacao(id: 18, dataHora: DateTime.now(), valor: 5, indicador: Libra,);
    final cotacaoLibra4 = 
     Cotacao(id: 19, dataHora: DateTime.now(), valor: 2, indicador: Libra,);
    final cotacaoLibra5 =
     Cotacao(id: 20, dataHora: DateTime.now(), valor: 4, indicador: Libra,);


    final cotacaoPeso = 
     Cotacao(id: 21, dataHora: DateTime.now(), valor: 1.56, indicador: Peso,);
    final cotacaoPeso2 =
     Cotacao(id: 22, dataHora: DateTime.now(), valor: 3.69, indicador: Peso,);
    final cotacaoPeso3 =
     Cotacao(id: 23, dataHora: DateTime.now(), valor: 4.20, indicador: Peso,);
    final cotacaoPeso4 =
     Cotacao(id: 24, dataHora: DateTime.now(), valor: 3.12, indicador: Peso,);
    final cotacaoPeso5 =
     Cotacao(id: 25, dataHora: DateTime.now(), valor: 3.21, indicador: Peso,);

    indicadores.add(Euro);
    indicadores.add(Real);
    indicadores.add(Dolar);
    indicadores.add(Libra);
    indicadores.add(Peso);

    cotacoes.add(cotacaoEuro);
    cotacoes.add(cotacaoEuro2);
    cotacoes.add(cotacaoEuro3);
    cotacoes.add(cotacaoEuro4);
    cotacoes.add(cotacaoEuro5);

    cotacoes.add(cotacaoReal);
    cotacoes.add(cotacaoReal2);
    cotacoes.add(cotacaoReal3);
    cotacoes.add(cotacaoReal4);
    cotacoes.add(cotacaoReal5);
    
    cotacoes.add(cotacaoDolar);
    cotacoes.add(cotacaoDolar2);
    cotacoes.add(cotacaoDolar3);
    cotacoes.add(cotacaoDolar4);
    cotacoes.add(cotacaoDolar5);

    cotacoes.add(cotacaoLibra);
    cotacoes.add(cotacaoLibra2);
    cotacoes.add(cotacaoLibra3);
    cotacoes.add(cotacaoLibra4);
    cotacoes.add(cotacaoLibra5);

    cotacoes.add(cotacaoPeso);
    cotacoes.add(cotacaoPeso2);
    cotacoes.add(cotacaoPeso3);
    cotacoes.add(cotacaoPeso4);
    cotacoes.add(cotacaoPeso5);
  }
    @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 80, 20, 90),
          title: _currentIndex == 0
              ? const Text('Cadastro de Indicadores', style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ))
              : const Text('Cadastro de Cotações', style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              )),


          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'Indicadores'),
              Tab(text: 'Cotações'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            buildIndicadoresTab(),
            buildCotacoesTab(),
          ],
        ),
      ),
    );
  }

  Widget buildIndicadoresTab(){
    return Column(
      children: [
        Expanded(
          child: indicadores.isEmpty
              ? Center(
                  child: Text('Sua Lista de Indicadores está vazia',
                      style: TextStyle(color: Colors.grey.shade600)),
            )
          : ListView.builder(
              itemCount: indicadores.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'ID: ${indicadores[index].id} - Descricao: ${indicadores[index].descricao}'
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          modifyIndicador(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeIndicador(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                _showAddIndicadorDialog();            
              },
              child: const Text('Adicionar um novo Indicador',
                  style: TextStyle(color: Colors.purple)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCotacoesTab() {
    return Column(
      children: [
        Expanded(
          child: cotacoes.isEmpty
          ? Center(
              child: Text('Sua lista de cotações esta vazia',
                style: TextStyle(color: Colors.grey.shade600)),
            )
          : ListView.builder(
              itemCount: cotacoes.length,
              itemBuilder: (context, index) {
                String formattedDate = DateFormat('dd/MM/yyyy')
                  .format(cotacoes[index].dataHora);
                String formattedValue =
                    NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                        .format(cotacoes[index].valor);
                return ListTile(
                  title: Text(
                    'ID: ${cotacoes[index].id} - Data de Registro: $formattedDate - Valor: $formattedValue - Indicador: ${cotacoes[index].indicador.descricao}',
                  ),
                  tileColor: cotacoes[index].isSelected
                      ? Colors.grey.shade300
                      : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        activeColor: Colors.purple,
                        value: cotacoes[index].isSelected,
                        onChanged: (value) {
                          setState(() {
                            cotacoes[index].isSelected = value ?? false;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeCotacao(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showAddCotacaoDialog();
                      },
                      child: const Text('Registrar Cotação',
                          style: TextStyle(color: Colors.purple)),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        _showChar(context);
                      },
                      child: const Text('Gerar Gráfico',
                          style: TextStyle(color: Colors.purple)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    void _showAddIndicadorDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Adicionar um novo indicador',
                style: TextStyle(color: Colors.purple)),
            content: TextField(
              controller: descricaoController,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                labelText: 'Descrição do indicador',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar', style: TextStyle(color: Colors.purple)),
                onPressed: () {
                  Navigator.of(context).pop();
                  descricaoController.clear();
                },
              ),
              TextButton(
                child: const Text('Adicionar', style: TextStyle(color: Colors.purple)),
                onPressed: () {
                  addIndicador();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void _showAddCotacaoDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text('Registrar Cotação',
                    style:  TextStyle(color: Colors.purple)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton<Indicador>(
                      value: selectedIndicador,
                      items: indicadores.map((ind) {
                        return DropdownMenuItem<Indicador>(
                          value: ind,
                          child:  Text(ind.descricao),
                        );
                      }).toList(),
                      onChanged: (ind) {
                        setState(() {
                          selectedIndicador = ind;
                          _updateSelectedIndicadorMessage(ind);
                        });
                      },
                      hint: Text(selectedIndicadorMessage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'R\$',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: valorController,
                              cursorColor: Colors.grey,
                              keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Valor da cotação',
                            labelStyle:
                                TextStyle(color: Colors.grey.shade600),
                            border: OutlineInputBorder(
                              borderSide:
                                BorderSide(color: Colors.grey.shade600),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade600),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar', style: TextStyle(color: Colors.purple)),
              onPressed: () {
                Navigator.of(context).pop();
                selectedIndicador = null;
                valorController.clear();
              },
            ),
            TextButton(
              child: 
                  const Text('Registrar', style: TextStyle(color: Colors.purple)),
                  onPressed: () {
                    if (selectedIndicador != null) {
                      addCotacao();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void addIndicador(){
    final descricao = descricaoController.text;
    if (descricao.isNotEmpty){
      return;
    }
    final indicador = Indicador(id: nextIndicadorId, descricao: descricao);
    setState(() {
      indicadores.add(indicador);
      nextIndicadorId++;
      descricaoController.clear();
    });
  }
  
  void removeIndicador(int index) {
    setState(() {
      indicadores.removeAt(index);
    });
  }

  void addCotacao() {
    final valor = 
        double.tryParse(valorController.text.replaceAll(',','.')) ?? 0.0;
    if (selectedIndicador == null || valor <= 0.0) {
      return;
    }
    final cotacao = Cotacao(
      id: nextCotacaoId,
       dataHora: DateTime.now(),
        valor: valor,
         indicador: selectedIndicador!,
         isSelected: true,
    );
    setState(() {
      cotacoes.add(cotacao);
      nextCotacaoId++;
      selectedIndicador = null;
      valorController.clear();
      _updateSelectedIndicadorMessage(selectedIndicador);
    });
  }

  void removeCotacao(int index){
    setState(() {
      cotacoes.removeAt(index);
    });
  }

  void modifyIndicador(int index) {
    descricaoController.text = indicadores[index].descricao;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('Modicar Indicador', style: TextStyle(color: Colors.purple)),
          content: TextField(
            controller: descricaoController,
            cursorColor: Colors.grey.shade600,
            decoration: InputDecoration(
              labelText: 'Nova descrição do Indicador',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              labelStyle: TextStyle(color: Colors.grey.shade600)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar', style: TextStyle(color:Colors.purple)),
              onPressed: () {
                setState(() {
                  indicadores[index].descricao = descricaoController.text;
                });
                Navigator.of(context).pop();
                descricaoController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  void _showChar(BuildContext context) {
    final selectedCotacoes = 
        cotacoes.where((Cotacao) => Cotacao.isSelected).toList();
    if (selectedCotacoes.isEmpty) {
      return;
    }

    Map<Indicador, List<Cotacao>> groupedCotacoes = 
        grupoCotacoesIndicador(selectedCotacoes);

    final selectedIndicadores = 
        selectedCotacoes.map((Cotacao) => Cotacao.indicador).toSet().toList();

    if (selectedIndicadores.length == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gráfico - ${selectedIndicadores[0].descricao}"),
            content: SizedBox(
              width: 1600,
              height: 800,
              child: LineChartSample7(
                  cotacoes: selectedCotacoes, groupedCotacoes: groupedCotacoes),
            ),
            actions: <Widget> [
              TextButton(
                child: const Text("Fechar", style: TextStyle(color: Colors.purple)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            ],
          );
        },
      );
    } else if (selectedIndicadores.length == 2) {
      final indicatorNames = selectedIndicadores
          .map((Indicador) => Indicador.descricao)
          .join(" e ");
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gráfico de Cotação - $indicatorNames"),
            content: SizedBox(
              width: 1600,
              height: 800,
              child: LineChartSample7(
                  cotacoes: selectedCotacoes, groupedCotacoes: groupedCotacoes),
            ),
            actions: <Widget> [
              TextButton(
                child: const Text("Fechar", style: TextStyle(color: Colors.purple)),
                onPressed: () {
                  Navigator.of(context).pop();
                })
            ],
          );
        },
      );
    } else if (selectedIndicadores.length == 3) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                  "Gráfico de Cotações - ${selectedIndicadores[0].descricao}, ${selectedIndicadores[1].descricao} e ${selectedIndicadores[2].descricao}"),
            content: SizedBox(
              width: 1600,
              height: 800,
              child: LineChartSample7(
                  cotacoes: selectedCotacoes, groupedCotacoes: groupedCotacoes),
              ),
              actions: <Widget> [
                TextButton(
                  child: const Text("Fechar", style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
              ],
            );
          },
        );
    } else if (selectedIndicadores.length == 4) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Gráfico de Cotações - ${selectedIndicadores[0].descricao}, ${selectedIndicadores[1].descricao}, ${selectedIndicadores[2].descricao}, ${selectedIndicadores[3].descricao} "),
            content: SizedBox(
              width: 1600,
              height: 800,
              child: LineChartSample7(
                cotacoes: selectedCotacoes, groupedCotacoes: groupedCotacoes),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("Fechar", style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
              ],
            );
          },
        );
    } else if (selectedIndicadores.length == 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Gráfico de Cotações - ${selectedIndicadores[1].descricao}, ${selectedIndicadores[2].descricao}, ${selectedIndicadores[3].descricao}, ${selectedIndicadores[4].descricao}, ${selectedIndicadores[4].descricao} "),
            content: SizedBox(
              width: 1600,
              height: 800,
              child: LineChartSample7(
                  cotacoes: selectedCotacoes, groupedCotacoes: groupedCotacoes),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Fechar", style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                })
            ],
          );
        },
      );
    }
  }
  void _updateSelectedIndicadorMessage(Indicador? ind) {
    setState(() {
      if (ind != null){
        selectedIndicadorMessage = ind.descricao;
      } else {
        selectedIndicadorMessage = 'Selecione um Indicador';
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: IndicadorScreen(),
  ));
}

    
  
  

 