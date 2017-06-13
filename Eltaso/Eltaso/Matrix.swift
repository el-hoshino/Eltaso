//
//  Matrix.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/04.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public enum MatrixInitError: Error {
	case rowsWithDifferentColumns
}

public enum MatrixMathError: Error {
	case sizeMismatch
}

public struct Matrix <Element> {
	
	fileprivate var _value: [Element]
	fileprivate var _columnCount: Int
	fileprivate var _rowCount: Int
	
	public typealias Index = (i: Int, j: Int)
	public typealias Size = (m: Int, n: Int)
	public typealias Indices = (rows: CountableRange<Int>, columns: CountableRange<Int>)
	public var size: Size {
		return (self._rowCount, self._columnCount)
	}
	public var indices: Indices {
		return (0 ..< self._rowCount, 0 ..< self._columnCount)
	}
	
	public init(_ array: [[Element]]) throws {
		let rowCount = array.count
		let columnCount = array.first?.count ?? 0
		for row in array {
			guard row.count == columnCount else {
				throw MatrixInitError.rowsWithDifferentColumns
			}
		}
		self._value = array.flatten
		self._columnCount = columnCount
		self._rowCount = rowCount
	}
	
	public init(rows: [[Element]]) throws {
		self = try Matrix(rows)
	}
	
	public init(columns: [[Element]]) throws {
		self = try Matrix(columns).transposed
	}
	
	public init(size: Size, repeatedValue: Element) {
		let elementCount = size.m * size.n
		let elements = (0 ..< elementCount).map { (_) -> Element in
			return repeatedValue
		}
		self._value = elements
		self._columnCount = size.n
		self._rowCount = size.m
	}
	
	public subscript(index: Index) -> Element {
		get {
			let i = index.i, j = index.j
			return self[i, j]
		}
		set {
			let i = index.i, j = index.j
			self[i, j] = newValue
		}
	}
	
	public subscript(i: Int, j: Int) -> Element {
		get {
			let index = i * self._columnCount + j
			return self._value[index]
		}
		set {
			let index = i * self._columnCount + j
			self._value[index] = newValue
		}
	}
	
	public subscript(row i: Int) -> [Element] {
		return self.indices.columns.map({ (j) -> Element in
			return self[(i, j)]
		})
	}
	
	public subscript(column j: Int) -> [Element] {
		return self.indices.rows.map({ (i) -> Element in
			return self[(i, j)]
		})
	}
	
}

extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	public init(size: Size) {
		self.init(size: size, repeatedValue: 0)
	}
	
}

extension Matrix {
	
	public var isEmpty: Bool {
		return !(self.size.m > 0 && self.size.n > 0)
	}
	
	public var isSquare: Bool {
		return self.size.m == self.size.n
	}
	
}

extension Matrix {
	
	public var elements: [Element] {
		return self._value
	}
	
}

extension Matrix {
	
	public var rows: [[Element]] {
		return self.indices.rows.map({ (i) -> [Element] in
			return self[row: i]
		})
	}
	
	public var columns: [[Element]] {
		return self.indices.columns.map({ (j) -> [Element] in
			return self[column: j]
		})
	}
	
}

extension Matrix {
	
	public var transposed: Matrix {
		
		var transposed = self
		transposed._columnCount = self._rowCount
		transposed._rowCount = self._columnCount
		
		for i in transposed.indices.rows {
			for j in transposed.indices.columns {
				transposed[i, j] = self[j, i]
			}
		}
		
		return transposed
		
	}
	
	public mutating func transpose() {
		self = self.transposed
	}
	
}

extension Matrix {
	
	public func arrayedByRow() -> [Element] {
		return self._value
	}
	
	public func arrayedByColumn() -> [Element] {
		return self.transposed._value
	}
	
}

extension Matrix {
	
	public func enumeratedByRow() -> [(index: Index, element: Element)] {
		
		let enumeratedMatrix = self.indices.rows.map { (i) -> [(index: Index, element: Element)] in
			return self.indices.columns.map({ (j) -> (index: Index, element: Element) in
				return ((i, j), self[i, j])
			})
		}
		
		return enumeratedMatrix.reduce(+) ?? []
		
	}
	
	public func enumeratedByColumn() -> [(index: Index, element: Element)] {
		
		let enumeratedMatrix = self.indices.columns.map { (j) -> [(index: Index, element: Element)] in
			return self.indices.rows.map({ (i) -> (index: Index, element: Element) in
				return ((i, j), self[i, j])
			})
		}
		
		return enumeratedMatrix.reduce(+) ?? []
		
	}
	
	@available(*, deprecated: 3.3, message: "Use Matrix#enumeratedByRow() or Matrix#enumeratedByColumn() instead")
	public func enumerated() -> [(index: Index, element: Element)] {
		return self.enumeratedByRow()
	}
	
}

private extension Matrix {
	
	func checkRowSize(of row: [Element]) throws {
		guard row.count == self.size.n else {
			throw MatrixMathError.sizeMismatch
		}
	}
	
	func checkColumnSize(of column: [Element]) throws {
		guard column.count == self.size.m else {
			throw MatrixMathError.sizeMismatch
		}
	}
	
}

private extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	func countAdjustedRow(from row: [Element]) -> [Element] {
		
		var row = row
		
		while row.count < self.size.n {
			row.append(0)
		}
		while row.count > self.size.n {
			row.removeLast()
		}
		
		return row
		
	}
	
	func countAdjustedColumn(from column: [Element]) -> [Element] {
		
		var column = column
		
		while column.count < self.size.n {
			column.append(0)
		}
		while column.count > self.size.n {
			column.removeLast()
		}
		
		return column
		
	}
	
}

private extension Matrix where Element: ExpressibleByNilLiteral {
	
	func countAdjustedRow(from row: [Element]) -> [Element] {
		
		var row = row
		
		while row.count < self.size.n {
			row.append(nil)
		}
		while row.count > self.size.n {
			row.removeLast()
		}
		
		return row
		
	}
	
	func countAdjustedColumn(from column: [Element]) -> [Element] {
		
		var column = column
		
		while column.count < self.size.n {
			column.append(nil)
		}
		while column.count > self.size.n {
			column.removeLast()
		}
		
		return column
		
	}
	
}

private extension Matrix {
	
	func unsafeAppendingRow(_ row: [Element]) -> Matrix<Element> {
		
		var matrix = self
		matrix._value += row
		matrix._rowCount.increase()
		return matrix
		
	}
	
	func unsafeInsertingRow(_ row: [Element], at i: Int) -> Matrix<Element> {
		
		var matrix = self
		let initialInsertingIndex = i * self._columnCount
		row.enumerated().forEach { (cell) in
			let j = cell.offset
			matrix._value.insert(cell.element, at: initialInsertingIndex + j)
		}
		matrix._rowCount.increase()
		return matrix
		
	}
	
}

extension Matrix {
	
	public func appendingRow(_ row: [Element]) throws -> Matrix<Element> {
		try self.checkRowSize(of: row)
		return self.unsafeAppendingRow(row)
	}
	
	public func insertingRow(_ row: [Element], at i: Int) throws -> Matrix<Element> {
		try self.checkRowSize(of: row)
		return self.unsafeInsertingRow(row, at: i)
	}
	
	public mutating func appendRow(_ row: [Element]) throws {
		self = try self.appendingRow(row)
	}
	
	public mutating func insertRow(_ row: [Element], at i: Int) throws {
		self = try self.insertingRow(row, at: i)
	}
	
}

extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	public func autoAppendingRow(_ row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeAppendingRow(row)
	}
	
	public func autoInsertingRow(_ row: [Element], at i: Int) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeInsertingRow(row, at: i)
	}
	
	public mutating func autoAppendRow(_ row: [Element]) {
		self = self.autoAppendingRow(row)
	}
	
	public mutating func autoInsertRow(_ row: [Element], at i: Int) {
		self = self.autoInsertingRow(row, at: i)
	}
	
}

extension Matrix where Element: ExpressibleByNilLiteral {
	
	public func autoAppendingRow(_ row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeAppendingRow(row)
	}
	
	public func autoInsertingRow(_ row: [Element], at i: Int) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeInsertingRow(row, at: i)
	}
	
	public mutating func autoAppendRow(_ row: [Element]) {
		self = self.autoAppendingRow(row)
	}
	
	public mutating func autoInsertRow(_ row: [Element], at i: Int) {
		self = self.autoInsertingRow(row, at: i)
	}
	
}

private extension Matrix {
	
	func unsafeAppendingColumn(_ column: [Element]) -> Matrix<Element> {
		
		var matrix = self
		column.enumerated().reversed().forEach { (cell) in
			let i = cell.offset
			matrix._value.insert(cell.element, at: i * self._columnCount + self._columnCount)
		}
		matrix._columnCount.increase()
		
		return matrix
		
	}
	
	func unsafeInsertingColumn(_ column: [Element], at j: Int) -> Matrix<Element> {
		
		var matrix = self
		column.enumerated().reversed().forEach { (cell) in
			let i = cell.offset
			matrix._value.insert(cell.element, at: i * self._columnCount + j)
		}
		matrix._columnCount.increase()
		
		return matrix
		
	}
	
}

extension Matrix {
	
	public func appendingColumn(_ column: [Element]) throws -> Matrix<Element> {
		try self.checkColumnSize(of: column)
		return self.unsafeAppendingColumn(column)
	}
	
	public func insertingColumn(_ column: [Element], at j: Int) throws -> Matrix<Element> {
		try self.checkColumnSize(of: column)
		return self.unsafeInsertingColumn(column, at: j)
	}
	
	public mutating func appendColumn(_ column: [Element]) throws {
		self = try self.appendingColumn(column)
	}
	
	public mutating func insertColumn(_ column: [Element], at j: Int) throws {
		self = try self.insertingColumn(column, at: j)
	}
	
}

extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	public func autoAppendingColumn(_ column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeAppendingColumn(column)
	}
	
	public func autoInsertingColumn(_ column: [Element], at j: Int) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeInsertingColumn(column, at: j)
	}
	
	public mutating func autoAppendColumn(_ column: [Element]) {
		self = self.autoAppendingColumn(column)
	}
	
	public mutating func autoInsertColumn(_ column: [Element], at j: Int) {
		self = self.autoInsertingColumn(column, at: j)
	}
	
}

extension Matrix where Element: ExpressibleByNilLiteral {
	
	public func autoAppendingColumn(_ column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeAppendingColumn(column)
	}
	
	public func autoInsertingColumn(_ column: [Element], at j: Int) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeInsertingColumn(column, at: j)
	}
	
	public mutating func autoAppendColumn(_ column: [Element]) {
		self = self.autoAppendingColumn(column)
	}
	
	public mutating func autoInsertColumn(_ column: [Element], at j: Int) {
		self = self.autoInsertingColumn(column, at: j)
	}
	
}

private extension Matrix {
	
	func unsafeReplacingRow(at i: Int, with row: [Element]) -> Matrix<Element> {
		
		var matrix = self
		let initialInsertingIndex = i * self._columnCount
		row.enumerated().forEach { (cell) in
			let j = cell.offset
			matrix._value[initialInsertingIndex + j] = cell.element
		}
		return matrix
		
	}
	
	func unsafeReplacingFirstRow(with row: [Element]) -> Matrix<Element> {
		
		var matrix = self
		row.enumerated().forEach { (cell) in
			let j = cell.offset
			matrix._value[j] = cell.element
		}
		return matrix
		
	}
	
	func unsafeReplacingLastRow(with row: [Element]) -> Matrix<Element> {
		
		var matrix = self
		let initialInsertingIndex = self._rowCount.decreased * self._columnCount
		row.enumerated().forEach { (cell) in
			let j = cell.offset
			matrix._value[initialInsertingIndex + j] = cell.element
		}
		return matrix
		
	}
	
}

extension Matrix {
	
	public func replacingRow(at i: Int, with row: [Element]) throws -> Matrix<Element> {
		try self.checkRowSize(of: row)
		return self.unsafeReplacingRow(at: i, with: row)
	}
	
	public func replacingFirstRow(with row: [Element]) throws -> Matrix<Element> {
		try self.checkRowSize(of: row)
		return self.unsafeReplacingFirstRow(with: row)
	}
	
	public func replacingLastRow(with row: [Element]) throws -> Matrix<Element> {
		try self.checkRowSize(of: row)
		return self.unsafeReplacingLastRow(with: row)
	}
	
	public mutating func replaceRow(at i: Int, with row: [Element]) throws {
		self = try self.replacingRow(at: i, with: row)
	}
	
	public mutating func replaceFirstRow(with row: [Element]) throws {
		self = try self.replacingFirstRow(with: row)
	}
	
	public mutating func replaceLastRow(with row: [Element]) throws {
		self = try self.replacingLastRow(with: row)
	}
	
}

extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	public func autoReplacingRow(at i: Int, with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingRow(at: i, with: row)
	}
	
	public func autoReplacingFirstRow(with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingFirstRow(with: row)
	}
	
	public func autoReplacingLastRow(with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingLastRow(with: row)
	}
	
	public mutating func autoReplaceRow(at i: Int, with row: [Element]) {
		self = self.autoReplacingRow(at: i, with: row)
	}
	
	public mutating func autoReplaceFirstRow(with row: [Element]) {
		self = self.autoReplacingFirstRow(with: row)
	}
	
	public mutating func autoReplaceLastRow(with row: [Element]) {
		self = self.autoReplacingLastRow(with: row)
	}
	
}

extension Matrix where Element: ExpressibleByNilLiteral {
	
	public func autoReplacingRow(at i: Int, with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingRow(at: i, with: row)
	}
	
	public func autoReplacingFirstRow(with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingFirstRow(with: row)
	}
	
	public func autoReplacingLastRow(with row: [Element]) -> Matrix<Element> {
		let row = self.countAdjustedRow(from: row)
		return self.unsafeReplacingLastRow(with: row)
	}
	
	public mutating func autoReplaceRow(at i: Int, with row: [Element]) {
		self = self.autoReplacingRow(at: i, with: row)
	}
	
	public mutating func autoReplaceFirstRow(with row: [Element]) {
		self = self.autoReplacingFirstRow(with: row)
	}
	
	public mutating func autoReplaceLastRow(with row: [Element]) {
		self = self.autoReplacingLastRow(with: row)
	}
	
}

private extension Matrix {
	
	func unsafeReplacingColumn(at j: Int, with column: [Element]) -> Matrix<Element> {
		
		var matrix = self
		column.enumerated().forEach { (cell) in
			let i = cell.offset
			matrix._value[i * self._columnCount + j] = cell.element
		}
		return matrix
		
	}
	
	func unsafeReplacingFirstColumn(with column: [Element]) -> Matrix<Element> {
		
		var matrix = self
		column.enumerated().forEach { (cell) in
			let i = cell.offset
			matrix._value[i * self._columnCount] = cell.element
		}
		return matrix
		
	}
	
	func unsafeReplacingLastColumn(with column: [Element]) -> Matrix<Element> {
		
		var matrix = self
		column.enumerated().forEach { (cell) in
			let i = cell.offset
			matrix._value[i * self._columnCount + self._rowCount.decreased] = cell.element
		}
		return matrix
		
	}
	
}

extension Matrix {
	
	public func replacingColumn(at j: Int, with column: [Element]) throws -> Matrix<Element> {
		try self.checkColumnSize(of: column)
		return self.unsafeReplacingColumn(at: j, with: column)
	}
	
	public func replacingFirstColumn(with column: [Element]) throws -> Matrix<Element> {
		try self.checkColumnSize(of: column)
		return self.unsafeReplacingFirstColumn(with: column)
	}
	
	public func replacingLastColumn(with column: [Element]) throws -> Matrix<Element> {
		try self.checkColumnSize(of: column)
		return self.unsafeReplacingLastColumn(with: column)
	}
	
	public mutating func replaceColumn(at j: Int, with column: [Element]) throws {
		self = try self.replacingColumn(at: j, with: column)
	}
	
	public mutating func replaceFirstColumn(with column: [Element]) throws {
		self = try self.replacingFirstColumn(with: column)
	}
	
	public mutating func replaceLastColumn(with column: [Element]) throws {
		self = try self.replacingLastColumn(with: column)
	}
	
}

extension Matrix where Element: ExpressibleByIntegerLiteral {
	
	public func autoReplacingColumn(at j: Int, with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingColumn(at: j, with: column)
	}
	
	public func autoReplacingFirstColumn(with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingFirstColumn(with: column)
	}
	
	public func autoReplacingLastColumn(with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingLastColumn(with: column)
	}
	
	public mutating func autoReplaceColumn(at j: Int, with column: [Element]) {
		self = self.autoReplacingColumn(at: j, with: column)
	}
	
	public mutating func autoReplaceFirstColumn(with column: [Element]) {
		self = self.autoReplacingFirstColumn(with: column)
	}
	
	public mutating func autoReplaceLastColumn(with column: [Element]) {
		self = self.autoReplacingLastColumn(with: column)
	}
	
}

extension Matrix where Element: ExpressibleByNilLiteral {
	
	public func autoReplacingColumn(at j: Int, with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingColumn(at: j, with: column)
	}
	
	public func autoReplacingFirstColumn(with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingFirstColumn(with: column)
	}
	
	public func autoReplacingLastColumn(with column: [Element]) -> Matrix<Element> {
		let column = self.countAdjustedColumn(from: column)
		return self.unsafeReplacingLastColumn(with: column)
	}
	
	public mutating func autoReplaceColumn(at j: Int, with column: [Element]) {
		self = self.autoReplacingColumn(at: j, with: column)
	}
	
	public mutating func autoReplaceFirstColumn(with column: [Element]) {
		self = self.autoReplacingFirstColumn(with: column)
	}
	
	public mutating func autoReplaceLastColumn(with column: [Element]) {
		self = self.autoReplacingLastColumn(with: column)
	}
	
}

extension Matrix {
	
	public func keepingRow(at m: Int) -> Matrix<Element> {
		
		let i = m.eltaso.limited(within: self.indices.rows)
		
		var matrix = self
		let row = matrix.indices.columns.map({ (j) -> Element in
			return matrix[i, j]
		})
		matrix._value = row
		matrix._rowCount = 1
		
		return matrix
		
	}
	
	public func keepingFirstRows(of m: Int) -> Matrix<Element> {
		
		let m = m.eltaso.limited(within: 0 ... self.size.m)
		
		var matrix = self
		let rows = (0 ..< m).map { (i) -> [Element] in
			return self.indices.columns.map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._rowCount = m
		
		return matrix
		
	}
	
	public func keepingLastRows(of m: Int) -> Matrix<Element> {
		
		let m = m.eltaso.limited(within: 0 ... self.size.m)
		
		var matrix = self
		let rows = (self._rowCount - m ..< self._rowCount).map { (i) -> [Element] in
			return self.indices.columns.map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._rowCount = m
		
		return matrix
		
	}
	
	public mutating func keepRow(at m: Int) {
		self = self.keepingRow(at: m)
	}
	
	public mutating func keepFirstRows(of m: Int) {
		self = self.keepingFirstRows(of: m)
	}
	
	public mutating func keepLastRows(of m: Int) {
		self = self.keepingLastRows(of: m)
	}
	
}

extension Matrix {
	
	public func keepingColumn(at n: Int) -> Matrix<Element> {
		
		let j = n.eltaso.limited(within: self.indices.columns)
		
		var matrix = self
		let column = self.indices.rows.map { (i) -> Element in
			return matrix[i, j]
		}
		matrix._value = column
		matrix._columnCount = 1
		
		return matrix
		
	}
	
	public func keepingFirstColumns(of n: Int) -> Matrix<Element> {
		
		let n = n.eltaso.limited(within: 0 ... self.size.n)
		
		var matrix = self
		let rows = self.indices.rows.map { (i) -> [Element] in
			return (0 ..< n).map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._columnCount = n
		
		return matrix
		
	}
	
	public func keepingLastColumns(of n: Int) -> Matrix<Element> {
		
		let n = n.eltaso.limited(within: 0 ... self.size.n)
		
		var matrix = self
		let rows = self.indices.rows.map { (i) -> [Element] in
			return (self._columnCount - n ..< self._columnCount).map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._columnCount = n
		
		return matrix
		
	}
	
	public mutating func keepColumn(at n: Int) {
		self = self.keepingColumn(at: n)
	}
	
	public mutating func keepFirstColumns(of n: Int) {
		self = self.keepingFirstColumns(of: n)
	}
	
	public mutating func keepLastColumns(of n: Int) {
		self = self.keepingLastColumns(of: n)
	}
	
}

extension Matrix {
	
	public func removingRow(at m: Int) -> Matrix<Element> {
		
		let i = m.eltaso.limited(within: self.indices.rows)
		
		var matrix = self
		let rows = Array(self.indices.rows).filter { (row) -> Bool in
			return row != i
		}.map { (i) -> [Element] in
			return self.indices.columns.map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._rowCount.decrease()
		
		return matrix
		
	}
	
	public func removingFirstRows(of m: Int) -> Matrix<Element> {
		
		let m = m.eltaso.limited(within: 0 ... self.size.m)
		
		var matrix = self
		let rows = (self._rowCount - m ..< self._rowCount).map { (i) -> [Element] in
			return self.indices.columns.map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._rowCount.decrease(by: m)
		
		return matrix
		
	}
	
	public func removingLastRows(of m: Int) -> Matrix<Element> {
		
		let m = m.eltaso.limited(within: 0 ... self.size.m)
		
		var matrix = self
		let rows = (0 ..< m).map { (i) -> [Element] in
			return self.indices.columns.map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._rowCount.decrease(by: m)
		
		return matrix
		
	}
	
	public mutating func removeRow(at m: Int) {
		self = self.removingRow(at: m)
	}
	
	public mutating func removeFirstRows(of m: Int) {
		self = self.removingFirstRows(of: m)
	}
	
	public mutating func removeLastRows(of m: Int) {
		self = self.removingLastRows(of: m)
	}
	
}

extension Matrix {
	
	public func removingColumn(at n: Int) -> Matrix<Element> {
		
		let j = n.eltaso.limited(within: self.indices.columns)
		
		var matrix = self
		let rows = self.indices.rows.map { (i) -> [Element] in
			return Array(self.indices.columns).filter({ (column) -> Bool in
				return column != j
			}).map({ (i) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._columnCount.decrease()
		
		return matrix
		
	}
	
	public func removingFirstColumns(of n: Int) -> Matrix<Element> {
		
		let n = n.eltaso.limited(within: 0 ... self.size.n)
		
		var matrix = self
		let rows = self.indices.rows.map { (i) -> [Element] in
			return (n ..< self._columnCount).map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._columnCount.decrease(by: n)
		
		return matrix
		
	}
	
	public func removingLastColumns(of n: Int) -> Matrix<Element> {
		
		let n = n.eltaso.limited(within: 0 ... self.size.n)
		
		var matrix = self
		let rows = self.indices.rows.map { (i) -> [Element] in
			return (0 ..< self._columnCount - n).map({ (j) -> Element in
				return matrix[i, j]
			})
		}
		matrix._value = rows.flatten
		matrix._columnCount.decrease(by: n)
		
		return matrix
		
	}
	
	public mutating func removeColumn(at n: Int) {
		self = self.removingColumn(at: n)
	}
	
	public mutating func removeFirstColumns(of n: Int) {
		self = self.removingFirstColumns(of: n)
	}
	
	public mutating func removeLastColumns(of n: Int) {
		self = self.removingLastColumns(of: n)
	}
	
}

extension Matrix {
	
	public mutating func applyForEach(_ transform: (Element) throws -> Element) rethrows {
		
		try self._value.applyForEach(transform)
		
	}
	
}

extension Matrix: CustomStringConvertible {
	
	public var description: String {
		let sizeText = "m: \(self.size.m), n: \(self.size.n)"
		let rows = self.indices.rows.map { (i) -> String in
			return self.indices.columns.reduce("", { (result, j) -> String in
				return result + "\(self[(i, j)])" + ", "
			})
		}
		return sizeText + "\n" + rows.reduce("", { (result, row) -> String in
			return result + row + "\n"
		})
	}
	
}

public func + <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: Numeric {
	
	guard lhs.size == rhs.size else {
		throw MatrixMathError.sizeMismatch
	}
	
	var matrix = lhs
	for i in matrix.indices.rows {
		for j in matrix.indices.columns {
			matrix[i, j] += rhs[i, j]
		}
	}
	
	return matrix
	
}

public func += <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: Numeric {
	lhs = try lhs + rhs
}

public func - <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: Numeric {
	
	guard lhs.size == rhs.size else {
		throw MatrixMathError.sizeMismatch
	}
	
	var matrix = lhs
	for i in matrix.indices.rows {
		for j in matrix.indices.columns {
			matrix[i, j] -= rhs[i, j]
		}
	}
	
	return matrix
	
}

public func -= <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: Numeric {
	lhs = try lhs - rhs
}

public func * <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: Numeric {
	
	guard lhs.size.n == rhs.size.m else {
		throw MatrixMathError.sizeMismatch
	}
	
	let resultSize: Matrix<T>.Size = (lhs.size.m, rhs.size.n)
	let resultIndices: Matrix<T>.Indices = (lhs.indices.rows, rhs.indices.columns)
	let resultElementFactorIndices: CountableRange<Int> = lhs.indices.columns
	
	func getMultipliedValue(at index: Matrix<T>.Index) -> T {
		let resultElementFactors = resultElementFactorIndices.map { (factorIndex) -> T in
			let factor = lhs[index.i, factorIndex] * rhs[factorIndex, index.j]
			return factor
		}
		let result = resultElementFactors.reduce { (result, next) -> T in
			let result = result + next
			return result
		}
		return result ?? 0
	}
	
	let value = resultIndices.rows.map { (i) -> [T] in
		return resultIndices.columns.map({ (j) -> T in
			return getMultipliedValue(at: (i, j))
		})
	}
	
	return try Matrix(value)
	
}

public func * <T> (lhs: T, rhs: Matrix<T>) -> Matrix<T> where T: Numeric {
	
	var matrix = rhs
	for i in matrix.indices.rows {
		for j in matrix.indices.columns {
			matrix[i, j] *= lhs
		}
	}
	return matrix
	
}

public func * <T> (lhs: Matrix<T>, rhs: T) -> Matrix<T> where T: Numeric {
	return rhs * lhs
}

public func *= <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: Numeric {
	lhs = try lhs * rhs
}

public func *= <T> (lhs: inout Matrix<T>, rhs: T) where T: Numeric {
	lhs = lhs * rhs
}

public func == <T> (lhs: Matrix<T>, rhs: Matrix<T>) -> Bool where T: Equatable {
	
	guard lhs.size == rhs.size else {
		return false
	}
	
	for i in 0 ..< lhs.size.m {
		for j in 0 ..< lhs.size.n {
			if lhs[i, j] != rhs[i, j] {
				return false
			}
		}
	}
	
	return true
	
}

public func != <T> (lhs: Matrix<T>, rhs: Matrix<T>) -> Bool where T: Equatable {
	return !(lhs == rhs)
}

public func …= (lhs: Matrix<Any>.Index, rhs: Matrix<Any>.Indices) -> Bool {
	return lhs.i …= rhs.rows && lhs.j …= rhs.columns
}
