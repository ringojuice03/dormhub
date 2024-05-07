/* 
Authored by: Reiven Lee
Company: Company Name
Project: DormHub
Feature: [DHUB-004] Booking
Description: The user is able to view the selected dorm’s
summary of billing along with the payment confirmation.
*/

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConditionalTextWidget extends StatelessWidget {
  final List<bool> monthsActive;

  const ConditionalTextWidget({super.key, required this.monthsActive});

  @override
  Widget build(BuildContext context) {
    List<String> months = [];
    for (int i = 0; i < monthsActive.length; i++) {
      if (monthsActive[i]) {
        months.add(_getMonthName(i + 1));
      }
    }

    return Text(
      months.join(' - '),
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  String _getMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  bool light = true;
  int year = 2024;
  bool oBook = true, fBook = true;
  List<bool> monthActive = List.generate(12, (index) => false);
  var activeMonths = [];
  int limitActive = 0;

  void incrementYear() {
    setState(() {
      year++;
    });
  }

  void decrementYear() {
    setState(() {
      year--;
    });
  }

  //main widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                child: Text(
                  'Booking',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          child: Image.asset(
                            'assets/images/boarding_house1.jpg',
                            height: 150,
                            width: 225,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bedspacer#1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        const Text(
                          '1234 Diaz St., Sta. Cruz',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: AutoSizeText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              style: TextStyle(fontSize: 10)),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(12),
                                        child: Image.asset(
                                            'assets/images/profile_pictures1.jpg'),
                                      ),
                                    ),
                                  ),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Larry Amet',
                                        style: TextStyle(
                                            fontSize: 5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Hosting Since 2010',
                                        style: TextStyle(fontSize: 5),
                                      ),
                                      Text(
                                        'Owner',
                                        style: TextStyle(fontSize: 5),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.mode_comment,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Container(
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 12,
                                ),
                              ),
                            ),
                            const Text('4.8', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                height: 8,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Guest Registration',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                oBook = !oBook;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: oBook
                                    ? Colors.white
                                    : const Color(0xFF474747),
                                minimumSize: const Size(1, 40)),
                            child: Text(
                              'Open Booking',
                              style: TextStyle(
                                  color: oBook ? Colors.black : Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                fBook = !fBook;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: fBook
                                    ? Colors.white
                                    : const Color(0xFF474747),
                                minimumSize: const Size(1, 40)),
                            child: Text(
                              'Fixed Booking',
                              style: TextStyle(
                                  color: fBook ? Colors.black : Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_up),
                        color: Colors.black,
                        iconSize: 24,
                        onPressed: incrementYear,
                      ),
                      Text(
                        '$year',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        color: Colors.black,
                        iconSize: 24,
                        onPressed: decrementYear,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color(0xFFECECEC),
                        width: 350,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (limitActive < 2) {
                                  if (monthActive[0] == false) {
                                    setState(() {
                                      limitActive += 1;
                                      monthActive[0] = true;
                                    });
                                  } else {
                                    setState(() {
                                      monthActive[0] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                } else {
                                  if (monthActive[0] == true) {
                                    setState(() {
                                      monthActive[0] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[0]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'January',
                                style: TextStyle(
                                    color: monthActive[0]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (limitActive < 2) {
                                  if (monthActive[1] == false) {
                                    setState(() {
                                      limitActive += 1;
                                      monthActive[1] = true;
                                    });
                                  } else {
                                    setState(() {
                                      monthActive[1] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                } else {
                                  if (monthActive[1] == true) {
                                    setState(() {
                                      monthActive[1] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[1]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'February',
                                style: TextStyle(
                                    color: monthActive[1]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (limitActive < 2) {
                                  if (monthActive[2] == false) {
                                    setState(() {
                                      limitActive += 1;
                                      monthActive[2] = true;
                                    });
                                  } else {
                                    setState(() {
                                      monthActive[2] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                } else {
                                  if (monthActive[2] == true) {
                                    setState(() {
                                      monthActive[2] = false;
                                      limitActive -= 1;
                                    });
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[2]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'March',
                                style: TextStyle(
                                    color: monthActive[2]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (limitActive < 2) {
                                    if (monthActive[3] == false) {
                                      setState(() {
                                        limitActive += 1;
                                        monthActive[3] = true;
                                      });
                                    } else {
                                      setState(() {
                                        monthActive[3] = false;
                                        limitActive -= 1;
                                      });
                                    }
                                  } else {
                                    if (monthActive[3] == true) {
                                      setState(() {
                                        monthActive[3] = false;
                                        limitActive -= 1;
                                      });
                                    }
                                  }
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[3]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'April',
                                style: TextStyle(
                                    color: monthActive[3]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color(0xFFECECEC),
                        width: 350,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (limitActive < 2) {
                                    if (monthActive[4] == false) {
                                      setState(() {
                                        limitActive += 1;
                                        monthActive[4] = true;
                                      });
                                    } else {
                                      setState(() {
                                        monthActive[4] = false;
                                        limitActive -= 1;
                                      });
                                    }
                                  } else {
                                    if (monthActive[4] == true) {
                                      setState(() {
                                        monthActive[4] = false;
                                        limitActive -= 1;
                                      });
                                    }
                                  }
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[4]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'May',
                                style: TextStyle(
                                    color: monthActive[4]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[5] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[5] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[5] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[5] == true) {
                                        setState(() {
                                          monthActive[5] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[5]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'June',
                                style: TextStyle(
                                    color: monthActive[5]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[6] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[6] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[6] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[6] == true) {
                                        setState(() {
                                          monthActive[6] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[6]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'July',
                                style: TextStyle(
                                    color: monthActive[6]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[7] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[7] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[7] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[7] == true) {
                                        setState(() {
                                          monthActive[7] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[7]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'August',
                                style: TextStyle(
                                    color: monthActive[7]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: const Color(0xFFECECEC),
                        width: 350,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[8] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[8] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[8] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[8] == true) {
                                        setState(() {
                                          monthActive[8] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[8]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'September',
                                style: TextStyle(
                                    color: monthActive[8]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[9] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[9] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[9] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[9] == true) {
                                        setState(() {
                                          monthActive[9] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[9]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'October',
                                style: TextStyle(
                                    color: monthActive[9]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[10] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[10] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[10] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[10] == true) {
                                        setState(() {
                                          monthActive[10] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[10]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'November',
                                style: TextStyle(
                                    color: monthActive[10]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (limitActive < 2) {
                                      if (monthActive[11] == false) {
                                        setState(() {
                                          limitActive += 1;
                                          monthActive[11] = true;
                                        });
                                      } else {
                                        setState(() {
                                          monthActive[11] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    } else {
                                      if (monthActive[11] == true) {
                                        setState(() {
                                          monthActive[11] = false;
                                          limitActive -= 1;
                                        });
                                      }
                                    }
                                  });
                                });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: monthActive[11]
                                      ? const Color(0xFF8C8C8C)
                                      : const Color(0xFFECECEC),
                                  fixedSize: const Size(87.5, 40)),
                              child: Text(
                                'December',
                                style: TextStyle(
                                    color: monthActive[11]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConditionalTextWidget(
                        monthsActive: monthActive,
                      )),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1 month advance 2 month deposit'),
                            Text('P4,500.00')
                          ],
                        ),
                        Text(
                          '    x1,500.00 / month',
                          style: TextStyle(fontSize: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Miscellaneous'), Text('P500.00')],
                        ),
                        Divider(
                          height: 20,
                          thickness: 1,
                          indent: 175,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Total'), Text('P5,000.00')],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Price Breakdown',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/ri_visa-line.svg'),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFECECEC),
                                fixedSize: const Size(110, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/images/arcticons_gcash.svg'),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFECECEC),
                                fixedSize: const Size(110, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFECECEC),
                                fixedSize: const Size(110, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: const Text(
                                'Over the Counter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'More Options',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                          child: Text(
                            'Cancellation Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 360,
                            child: AutoSizeText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mi blandit, elementum libero a, varius neque. Praesent vel ipsum  dignissim, finibus elit a, commodo neque. Etiam id porta metus, in varius elit. Morbi efficitur purus vitae condimentum fringilla. Nullam aliquet dapibus sapien eget semper.',
                              style: TextStyle(fontSize: 10),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('I understood'),
                        Switch(
                            value: light,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                light = value;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'P5,000.00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'One month advance and Two month deposit',
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: const Size(150, 50),
                          backgroundColor: const Color(0xFF474747)),
                      child: const Text(
                        'Review & Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
