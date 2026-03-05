import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final Map<String, bool> slotStatus = {
    'GF-E1': false, 'RRD-1': false, 'RRD-2': false, 'AWFIS-1': false, 'AWFIS-2': false,
    'VATIKA-A': false, 'VATIKA-B': false, 'SW-1': false, 'SW-2': false, 'GT-1': false,
    'GT-2': false, 'GF-E4': false,
    'RRD-3': false, 'RRD-4': false, 'RRD-5': false, 'TNG-1': false, 'TNG-2': false,
    'GF-D2': false, 'SW-D1': false, 'KBR-1': false, 'KBR-2': false, 'KBR-3': false,
    'GF-D0': false,
    'PRESTIGE-1': false, 'PRESTIGE-2': false, 'PRESTIGE-3': false, 'PRESTIGE-4': false,
    'VATIKA-C': false, 'KOTAK': false, 'YUBI-1': false, 'GALAXI': false,
    'TNG-LOBBY': false, 'YUBI-2': false, 'P1': false, 'P2': false, 'P3': false,
    'P6': false, 'P5': false, 'P4': false,
    'PRESTIGE-5': false, 'PRESTIGE-6': false,
    'GF-B1': false, 'GF-B2': false,
    'DURR-1': false, 'DURR-2': false, 'DURR-3': false, 'DURR-4': false, 'DURR-5': false,
    'MSOFT-1': true, 'MSOFT-2': true,
    'RRD-B1': false, 'RRD-B2': false, 'RRD-B3': false, 'RRD-B4': false, 'RRD-B5': false,
    'GF-A3': false, 'GF-A2': false, 'GF-A1': false, 'GF-A0': false,
    'RRD-A1': false, 'RRD-A2': false, 'RRD-A3': false, 'RRD-A4': false, 'RRD-A5': false,
    'RRD-A6': false, 'RRD-A7': false, 'RRD-A8': false, 'RRD-A9': false, 'RRD-A10': false,
    'RRD-A11': false, 'PPMSC': false, 'P-CORNER': false,
    'PRESTIGE-PPMSC': false,
  };

  Color get availableColor => const Color(0xFF00E676);
  Color get occupiedColor => const Color(0xFFFF1744);
  Color get bgColor => const Color(0xFF0A0E1A);
  Color get panelColor => const Color(0xFF111827);
  Color get borderColor => const Color(0xFF1E3A5F);

  Color slotColor(String key) =>
      (slotStatus[key] ?? false) ? occupiedColor : availableColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildLayout(),
                ),
              ),
            ),
          ),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      decoration: BoxDecoration(
        color: panelColor,
        border: Border(bottom: BorderSide(color: const Color(0xFF00B4FF), width: 2)),
        boxShadow: [BoxShadow(color: const Color(0xFF00B4FF).withOpacity(0.15), blurRadius: 12)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'PRESTIGE POLYGON PARKING',
            style: TextStyle(
              color: Color(0xFF00B4FF),
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
          const Text(
            'GROUND FLOOR — LIVE STATUS',
            style: TextStyle(
              color: Color(0xFF7EC8E3),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          Row(
            children: [
              _dot(availableColor),
              const SizedBox(width: 6),
              const Text('AVAILABLE', style: TextStyle(color: Color(0xFF00E676), fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              _dot(occupiedColor),
              const SizedBox(width: 6),
              const Text('OCCUPIED', style: TextStyle(color: Color(0xFFFF1744), fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dot(Color c) => Container(width: 14, height: 14, decoration: BoxDecoration(color: c, shape: BoxShape.circle));

  Widget _buildLegend() {
    int total = slotStatus.length;
    int occupied = slotStatus.values.where((v) => v).length;
    int available = total - occupied;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: BoxDecoration(
        color: panelColor,
        border: Border(top: BorderSide(color: borderColor, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statBox('TOTAL', total.toString(), const Color(0xFF00B4FF)),
          const SizedBox(width: 40),
          _statBox('AVAILABLE', available.toString(), availableColor),
          const SizedBox(width: 40),
          _statBox('OCCUPIED', occupied.toString(), occupiedColor),
        ],
      ),
    );
  }

  Widget _statBox(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.w900)),
        Text(label, style: TextStyle(color: color.withOpacity(0.7), fontSize: 12, letterSpacing: 1.5)),
      ],
    );
  }

  Widget _buildLayout() {
    return SizedBox(
      width: 1400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopSection(),
          const SizedBox(height: 8),
          _buildRowD(),
          const SizedBox(height: 8),
          _buildRowMiddle(),
          const SizedBox(height: 8),
          _buildRowB(),
          const SizedBox(height: 8),
          _buildRowA(),
          const SizedBox(height: 8),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sidePanel(),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              _entryBar(),
              const SizedBox(height: 6),
              _ventilationBar('VENTILATION SHAFT'),
              const SizedBox(height: 6),
              _buildRowE(),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _experienceCentre(),
      ],
    );
  }

  Widget _sidePanel() {
    return Column(
      children: [
        _labelBox('RM\nRoom-W', 90, 50, const Color(0xFF1A2A4A)),
        const SizedBox(height: 4),
        _labelBox('2W\nPEPL 7', 90, 40, const Color(0xFF1A3A2A)),
        const SizedBox(height: 4),
        _labelBox('EXP GRR', 90, 50, const Color(0xFF2A1A4A)),
        const SizedBox(height: 4),
        _labelBox('EXP LRR', 90, 50, const Color(0xFF2A1A4A)),
        const SizedBox(height: 4),
        _labelBox('VENT\nPANEL', 90, 80, const Color(0xFF1A2A1A)),
        const SizedBox(height: 4),
        _labelBox('SERV LIFT', 90, 40, const Color(0xFF3A2A1A)),
        const SizedBox(height: 4),
        _labelBox('FIRE\nSTAIRCASE', 90, 50, const Color(0xFF3A1A1A)),
        const SizedBox(height: 4),
        _labelBox('RECORD\nROOM', 90, 40, const Color(0xFF1A3A3A)),
        const SizedBox(height: 4),
        _labelBox('EV\nCHARGE', 90, 40, const Color(0xFF1A3A1A)),
        const SizedBox(height: 4),
        _labelBox('RM\nROOM E', 90, 40, const Color(0xFF1A2A4A)),
        const SizedBox(height: 4),
        _labelBox('GENERATOR\nROOM', 90, 50, const Color(0xFF2A1A1A)),
        const SizedBox(height: 4),
        _labelBox('OWC\nROOM', 90, 40, const Color(0xFF1A1A3A)),
        const SizedBox(height: 4),
        _labelBox('PEPL 12-2W', 90, 40, const Color(0xFF1A3A2A)),
      ],
    );
  }

  Widget _entryBar() {
    return Row(
      children: [
        _arrowBox('ENTRY GROUND TO 1F', 320, const Color(0xFF1A3A5A)),
        const SizedBox(width: 8),
        _arrowBox('ENTRY GF TO B1', 280, const Color(0xFF1A4A3A)),
        const SizedBox(width: 8),
        _entryLabel(),
      ],
    );
  }

  Widget _entryLabel() {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF00B4FF).withOpacity(0.15),
        border: Border.all(color: const Color(0xFF00B4FF), width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Center(
        child: Text('ENTRY', style: TextStyle(color: Color(0xFF00B4FF), fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 2)),
      ),
    );
  }

  Widget _buildRowE() {
    return Row(
      children: [
        _slot('GF-E1', 70, 45),
        const SizedBox(width: 4),
        _slot('RRD-1', 60, 45),
        const SizedBox(width: 4),
        _slot('RRD-2', 60, 45),
        const SizedBox(width: 4),
        _slot('AWFIS-1', 65, 45),
        const SizedBox(width: 4),
        _slot('AWFIS-2', 65, 45),
        const SizedBox(width: 4),
        _slot('VATIKA-A', 60, 45),
        const SizedBox(width: 4),
        _slot('VATIKA-B', 60, 45),
        const SizedBox(width: 4),
        _slot('SW-1', 55, 45),
        const SizedBox(width: 4),
        _slot('SW-2', 55, 45),
        const SizedBox(width: 4),
        _slot('GT-1', 55, 45),
        const SizedBox(width: 4),
        _slot('GT-2', 55, 45),
        const SizedBox(width: 4),
        _slot('GF-E4', 70, 45),
      ],
    );
  }

  Widget _buildRowD() {
    return Row(
      children: [
        const SizedBox(width: 98),
        _slot('RRD-3', 60, 45),
        const SizedBox(width: 4),
        _slot('RRD-4', 60, 45),
        const SizedBox(width: 4),
        _slot('RRD-5', 60, 45),
        const SizedBox(width: 4),
        _slot('TNG-1', 60, 45, color: const Color(0xFF0066CC)),
        const SizedBox(width: 4),
        _slot('TNG-2', 60, 45, color: const Color(0xFF0066CC)),
        const SizedBox(width: 4),
        _labelBox('GF-D2', 65, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 24),
        _slot('SW-D1', 60, 45),
        const SizedBox(width: 4),
        _slot('KBR-1', 65, 45, color: const Color(0xFFD4785A)),
        const SizedBox(width: 4),
        _slot('KBR-2', 65, 45, color: const Color(0xFFD4785A)),
        const SizedBox(width: 4),
        _slot('KBR-3', 65, 45, color: const Color(0xFFD4785A)),
        const SizedBox(width: 4),
        _labelBox('GF-D0', 65, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 8),
        _labelBox('FIRE STAIR\nCASE-2', 100, 70, const Color(0xFF3A1A1A)),
        const SizedBox(width: 4),
        _labelBox('FS-2', 60, 30, const Color(0xFFB8860B)),
      ],
    );
  }

  Widget _buildRowMiddle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 98),
        _buildLeftMiddleSlots(),
        const SizedBox(width: 16),
        _buildCentralLobby(),
        const SizedBox(width: 16),
        _labelBox('RECEPTION', 140, 60, const Color(0xFF1A2A4A)),
      ],
    );
  }

  Widget _buildLeftMiddleSlots() {
    return Column(
      children: [
        Row(
          children: [
            _namedSlot('PRESTIGE', 100, 40),
            const SizedBox(width: 4),
            _namedSlot('PRESTIGE', 100, 40),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _namedSlot('VATIKA', 100, 40),
            const SizedBox(width: 4),
            _namedSlot('PRESTIGE', 100, 40),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _namedSlot('KOTAK', 100, 40),
            const SizedBox(width: 4),
            _namedSlot('PRESTIGE', 100, 40),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _namedSlot('YUBI', 100, 40),
            const SizedBox(width: 4),
            _namedSlot('PRESTIGE', 100, 40),
          ],
        ),
      ],
    );
  }

  Widget _buildCentralLobby() {
    return Column(
      children: [
        Row(
          children: [
            _slot('GALAXI', 80, 40, color: const Color(0xFF1A3A2A)),
            const SizedBox(width: 4),
            _slot('P1', 70, 40),
            const SizedBox(width: 4),
            _slot('P2', 70, 40),
            const SizedBox(width: 4),
            _slot('P3', 70, 40),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Column(
              children: [
                _labelBox('TNG', 38, 35, const Color(0xFF0066CC)),
                const SizedBox(height: 4),
                _slot('YUBI-2', 80, 35, color: const Color(0xFF006633)),
              ],
            ),
            const SizedBox(width: 4),
            Container(
              width: 220,
              height: 75,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2A4A).withOpacity(0.8),
                border: Border.all(color: const Color(0xFF00B4FF), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text('GF LIFT LOBBY', style: TextStyle(color: Color(0xFF00B4FF), fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _slot('PRESTIGE-5', 80, 40, label: 'PRESTIGE'),
            const SizedBox(width: 4),
            _slot('P6', 70, 40),
            const SizedBox(width: 4),
            _slot('P5', 70, 40),
            const SizedBox(width: 4),
            _slot('P4', 70, 40),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            _slot('PRESTIGE-6', 80, 40, label: 'PRESTIGE'),
            const SizedBox(width: 4),
            _labelBox('PPMSC OFFICE', 170, 40, const Color(0xFF1A3A1A)),
            const SizedBox(width: 4),
            _slot('P-CORNER', 60, 40, label: 'P'),
          ],
        ),
      ],
    );
  }

  Widget _buildRowB() {
    return Row(
      children: [
        const SizedBox(width: 98),
        _labelBox('GF-B1', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 4),
        _slot('DURR-1', 65, 45, label: 'DURR'),
        const SizedBox(width: 4),
        _slot('DURR-2', 65, 45, label: 'DURR'),
        const SizedBox(width: 4),
        _slot('DURR-3', 65, 45, label: 'DURR'),
        const SizedBox(width: 4),
        _slot('DURR-4', 65, 45, label: 'DURR'),
        const SizedBox(width: 4),
        _slot('DURR-5', 65, 45, label: 'DURR'),
        const SizedBox(width: 4),
        _labelBox('GF-B2', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 8),
        _slot('MSOFT-1', 75, 45, label: 'MSOFT'),
        const SizedBox(width: 4),
        _slot('MSOFT-2', 75, 45, label: 'MSOFT'),
        const SizedBox(width: 4),
        _slot('RRD-B1', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-B2', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-B3', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-B4', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-B5', 60, 45, label: 'RRD'),
      ],
    );
  }

  Widget _buildRowA() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 98),
        _labelBox('GF-A3', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 4),
        _labelBox('GF-A2', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 4),
        _labelBox('GF-A1', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 4),
        _labelBox('GF-A0', 70, 45, const Color(0xFF1A2A3A)),
        const SizedBox(width: 8),
        _slot('RRD-A1', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A2', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A3', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A4', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A5', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A6', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A7', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A8', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A9', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A10', 60, 45, label: 'RRD'),
        const SizedBox(width: 4),
        _slot('RRD-A11', 60, 45, label: 'RRD'),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Column(
      children: [
        _ventilationBar('VENTILATION SHAFT'),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 98),
            _arrowBox('EXIT B1 TO GF', 400, const Color(0xFF1A3A2A)),
            const SizedBox(width: 8),
            _labelBox('DURR', 80, 45, const Color(0xFF2A1A1A)),
            const SizedBox(width: 8),
            _labelBox('ANANDRATHI', 200, 45, const Color(0xFF1A2A4A)),
            const SizedBox(width: 8),
            Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF00B4FF).withOpacity(0.15),
                border: Border.all(color: const Color(0xFF00B4FF), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text('EXIT', style: TextStyle(color: Color(0xFF00B4FF), fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 2)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _slot(String key, double w, double h, {String? label, Color? color}) {
    final bool isOccupied = slotStatus[key] ?? false;
    final Color baseColor = color ?? (isOccupied ? occupiedColor : availableColor);
    final Color bgC = isOccupied ? occupiedColor.withOpacity(0.25) : baseColor.withOpacity(0.15);
    final Color borderC = isOccupied ? occupiedColor : baseColor;
    final Color textC = isOccupied ? occupiedColor : (color != null ? color : availableColor);

    return GestureDetector(
      onTap: color == null
          ? () => setState(() => slotStatus[key] = !(slotStatus[key] ?? false))
          : null,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: bgC,
          border: Border.all(color: borderC, width: isOccupied ? 2.5 : 1.5),
          borderRadius: BorderRadius.circular(4),
          boxShadow: isOccupied
              ? [BoxShadow(color: occupiedColor.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)]
              : [BoxShadow(color: availableColor.withOpacity(0.2), blurRadius: 4)],
        ),
        child: Center(
          child: Text(
            label ?? key,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textC,
              fontSize: h > 40 ? 11 : 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _namedSlot(String label, double w, double h) {
    Color color;
    String key;
    if (label == 'PRESTIGE') {
      key = 'PRESTIGE-${label.hashCode}';
      color = const Color(0xFF4A90D9);
    } else if (label == 'VATIKA') {
      key = 'VATIKA-C';
      color = const Color(0xFF7B68EE);
    } else if (label == 'KOTAK') {
      key = 'KOTAK';
      color = const Color(0xFFFF8C00);
    } else {
      key = 'YUBI-1';
      color = const Color(0xFF32CD32);
    }
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w800)),
      ),
    );
  }

  Widget _labelBox(String text, double w, double h, Color bg) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFFB0C4DE), fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.3),
        ),
      ),
    );
  }

  Widget _arrowBox(String text, double w, Color bg) {
    return Container(
      width: w,
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: const Color(0xFF00B4FF).withOpacity(0.5), width: 1.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_forward, color: Color(0xFF00B4FF), size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Color(0xFF7EC8E3), fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 1)),
        ],
      ),
    );
  }

  Widget _ventilationBar(String text) {
    return Container(
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A1A),
        border: Border.all(color: const Color(0xFF2D5A2D), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 3)),
      ),
    );
  }

  Widget _experienceCentre() {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A4A),
        border: Border.all(color: const Color(0xFF4A90D9), width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Text(
          'Prestige\nExperience\nCentre',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF7EC8E3), fontSize: 14, fontWeight: FontWeight.w800, height: 1.5),
        ),
      ),
    );
  }
}