//
//  Matrix.swift
//  Eltaso
//
//  Created by 史　翔新 on 2016/10/04.
//  Copyright © 2016年 Crazism. All rights reserved.
//

import Foundation

public enum MatrixDimension {
	case row
	case column
}

public enum MatrixInitError: Error {
	case rowsWithDifferentColumns
}

enum MatrixMathError: Error {
	case sizeMismatch
}

public struct Matrix <Element> {
	
	fileprivate var _value: [[Element]]
	
	public typealias Index = (i: Int, j: Int)
	public typealias Size = (n: Int, m: Int)
	public typealias Indices = (columns: CountableRange<Int>, rows: CountableRange<Int>)
	public var size: Size {
		return (self._value.first?.count ?? 0, self._value.count)
	}
	public var indices: Indices {
		return (self._value.first?.indices ?? 0 ..< 0, self._value.indices)
	}
	
	public init(_ array: [[Element]]) throws {
		let columnCount = array.first?.count ?? 0
		for row in array {
			guard row.count == columnCount else {
				throw MatrixInitError.rowsWithDifferentColumns
			}
		}
		self._value = array.reduce([], { (result, row) -> [[Element]] in
			let row = row.keepingFirst(columnCount)
			return result + [row]
		})
	}
	
	public init(size: Size, repeatedValue: Element) {
		let rows = (0 ..< size.m).map { (_) -> [Element] in
			let elements = (0 ..< size.n).map({ (_) -> Element in
				return repeatedValue
			})
			return elements
		}
		self._value = rows
	}
	
	public subscript(index: Index) -> Element {
		get {
			let i = index.i, j = index.j
			return self._value[j][i]
		}
		set {
			let i = index.i, j = index.j
			self._value[j][i] = newValue
		}
	}
	
	public subscript(row j: Int) -> [Element] {
		return self._value[j]
	}
	
	public subscript(column i: Int) -> [Element] {
		return self._value.map({ (row) -> Element in
			return row[i]
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
		return self._value.isEmpty || self._value[0].isEmpty
	}
	
	public var isSquare: Bool {
		return self.size.m == self.size.n
	}
	
}

extension Matrix {
	
	public var transposed: Matrix {
		
		guard !self.isEmpty else {
			return self
		}
		
		let rows = (0 ..< self.size.m).map { (j) -> [Element] in
			let columns = (0 ..< self.size.n).map({ (i) -> Element in
				return self[(i, j)]
			})
			return columns
		}
		return try! Matrix(rows)
	}
	
	public mutating func transpose() {
		self = self.transposed
	}
	
}

extension Matrix {
	
	public func appendingRow(_ row: [Element]) throws -> Matrix<Element> {
		
		if !self.isEmpty {
			guard row.count == self.size.n else {
				throw MatrixMathError.sizeMismatch
			}
		}
		
		var matrix = self
		matrix._value.append(row)
		return matrix
		
	}
	
	public func insertingRow(_ row: [Element], at j: Int) throws -> Matrix<Element> {
		
		if !self.isEmpty {
			guard row.count == self.size.n else {
				throw MatrixMathError.sizeMismatch
			}
		}
		
		var matrix = self
		matrix._value.insert(row, at: j)
		return matrix
		
	}
	
	public mutating func appendRow(_ row: [Element]) throws {
		self = try self.appendingRow(row)
	}
	
	public mutating func insertRow(_ row: [Element], at j: Int) throws {
		self = try self.insertingRow(row, at: j)
	}
	
}

extension Matrix {
	
	public func appendingColumn(_ column: [Element]) throws -> Matrix<Element> {
		
		if !self.isEmpty {
			guard column.count == self.size.m else {
				throw MatrixMathError.sizeMismatch
			}
		}
		
		var matrix = self
		if matrix.isEmpty {
			matrix._value = column.map({ (_) -> [Element] in
				return []
			})
		}
		column.enumerated().forEach { (j, element) in
			matrix._value[j].append(element)
		}
		
		return matrix
		
	}
	
	public func insertingColumn(_ column: [Element], at i: Int) throws -> Matrix<Element> {
		
		if !self.isEmpty {
			guard column.count == self.size.m else {
				throw MatrixMathError.sizeMismatch
			}
		}
		
		var matrix = self
		if matrix.isEmpty {
			matrix._value = column.map({ (_) -> [Element] in
				return []
			})
		}
		column.enumerated().forEach { (j, element) in
			matrix._value[j].insert(element, at: i)
		}
		return matrix
		
	}
	
	public mutating func appendColumn(_ column: [Element]) throws {
		self = try self.appendingColumn(column)
	}
	
	public mutating func insertColumn(_ column: [Element], at i: Int) throws {
		self = try self.insertingColumn(column, at: i)
	}
	
}

extension Matrix {
	
	public func keepingRow(at m: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value.keep(at: m)
		return matrix
		
	}
	
	public func keepingFirstRows(of m: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value.keepFirst(m)
		return matrix
		
	}
	
	public func keepingLastRows(of m: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value.keepLast(m)
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
		
		var matrix = self
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.keeping(at: n)
		})
		return matrix
		
	}
	
	public func keepingFirstColumns(of n: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.keepingFirst(n)
		})
		return matrix
		
	}
	
	public func keepingLastColumns(of n: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.keepingLast(n)
		})
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
		
		var matrix = self
		matrix._value.remove(at: m)
		return matrix
		
	}
	
	public func removingFirstRows(of m: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value.removeFirst(m)
		return matrix
		
	}
	
	public func removingLastRows(of m: Int) -> Matrix<Element> {
		
		var matrix = self
		matrix._value.removeLast(m)
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
		
		var matrix = self
		guard 1 < self.size.n else {
			matrix._value = []
			return matrix
		}
		
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.removing(at: n)
		})
		return matrix
		
	}
	
	public func removingFirstColumns(of n: Int) -> Matrix<Element> {
		
		var matrix = self
		guard n < self.size.n else {
			matrix._value = []
			return matrix
		}
		
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.removingFirst(n)
		})
		return matrix
		
	}
	
	public func removingLastColumns(of n: Int) -> Matrix<Element> {
		
		var matrix = self
		guard n < self.size.n else {
			matrix._value = []
			return matrix
		}
		
		matrix._value = matrix._value.map({ (row) -> [Element] in
			return row.removingLast(n)
		})
		return matrix
		
	}
	
}

extension Matrix: CustomStringConvertible {
	
	public var description: String {
		return self._value.description
	}
	
}

public func + <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: AdditionOperatable {
	
	guard lhs.size == rhs.size else {
		throw MatrixMathError.sizeMismatch
	}
	
	var matrix = lhs
	for j in 0 ..< matrix.size.m {
		for i in 0 ..< matrix.size.n {
			matrix[(i, j)] += rhs[(i, j)]
		}
	}
	
	return matrix
	
}

public func += <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: AdditionOperatable {
	lhs = try lhs + rhs
}

public func - <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: SubtractionOperatable {
	
	guard lhs.size == rhs.size else {
		throw MatrixMathError.sizeMismatch
	}
	
	var matrix = lhs
	for j in 0 ..< matrix.size.m {
		for i in 0 ..< matrix.size.n {
			matrix[(i, j)] -= rhs[(i, j)]
		}
	}
	
	return matrix
	
}

public func -= <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: SubtractionOperatable {
	lhs = try lhs - rhs
}

public func * <T> (lhs: Matrix<T>, rhs: Matrix<T>) throws -> Matrix<T> where T: AdditionOperatable, T: MultiplicationOperatable {
	
	guard lhs.size.m == rhs.size.n && lhs.size.n == rhs.size.m else {
		throw MatrixMathError.sizeMismatch
	}
	
	let resultSize: Matrix<T>.Size = (lhs.size.m, rhs.size.n)
	let resultIndices: Matrix<T>.Indices = (lhs.indices.rows, rhs.indices.columns)
	let resultElementFactorIndices = lhs.indices.columns
	
	func getMultipliedValue(at index: Matrix<T>.Index) -> T {
		return resultElementFactorIndices.reduce(T.additionOperationInitialValue) { (result, indice) -> T in
			let factor = lhs[(indice, index.j)] * rhs[(index.i, indice)]
			return result + factor
		}
	}
	
	let value = resultIndices.rows.map { (j) -> [T] in
		return resultIndices.columns.map({ (i) -> T in
			return getMultipliedValue(at: (i, j))
		})
	}
	
	return try Matrix(value)
	
}

public func * <T> (lhs: T, rhs: Matrix<T>) -> Matrix<T> where T: MultiplicationOperatable {
	
	var matrix = rhs
	for j in matrix.indices.rows {
		for i in matrix.indices.columns {
			matrix[(i, j)] *= lhs
		}
	}
	return matrix
	
}

public func * <T> (lhs: Matrix<T>, rhs: T) -> Matrix<T> where T: MultiplicationOperatable {
	return rhs * lhs
}

public func *= <T> (lhs: inout Matrix<T>, rhs: Matrix<T>) throws where T: AdditionOperatable, T: MultiplicationOperatable {
	lhs = try lhs * rhs
}

public func *= <T> (lhs: inout Matrix<T>, rhs: T) where T: MultiplicationOperatable {
	lhs = lhs * rhs
}

public func == <T> (lhs: Matrix<T>, rhs: Matrix<T>) -> Bool where T: Equatable {
	
	guard lhs.size == rhs.size else {
		return false
	}
	
	for i in 0 ..< lhs.size.n {
		for j in 0 ..< lhs.size.m {
			if lhs[(i, j)] != rhs[(i, j)] {
				return false
			}
		}
	}
	
	return true
	
}

public func != <T> (lhs: Matrix<T>, rhs: Matrix<T>) -> Bool where T: Equatable {
	return !(lhs == rhs)
}
