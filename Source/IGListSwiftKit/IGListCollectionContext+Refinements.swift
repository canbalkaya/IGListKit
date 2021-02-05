/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import IGListKit
import UIKit

extension ListCollectionContext {
    /**
     Dequeues a cell from the collection view reuse pool.

     - Parameters:
        - reuseIdentifier: A reuse identifier for the specified cell. This parameter may be `nil`.
        - sectionController: The section controller requesting this information.
        - index: The index of the cell.

     - Returns: A cell dequeued from the reuse pool or a newly created one.
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(
        withReuseIdentifier reuseIdentifier: String,
        for sectionController: ListSectionController,
        at index: Int
    ) -> T {
        guard let cell = self.dequeueReusableCell(
            of: T.self,
            withReuseIdentifier: reuseIdentifier,
            for: sectionController,
            at: index
        ) as? T else {
            fatalError()
        }

        return cell
    }

    /**
     Dequeues a cell from the collection view reuse pool.

     - Parameters:
         - sectionController: The section controller requesting this information.
         - index: The index of the cell.

     - Returns: A cell dequeued from the reuse pool or a newly created one.

     - Note: This method uses a string representation of the cell class as the identifier.
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(
        for sectionController: ListSectionController,
        at index: Int
    ) -> T {
        guard let cell = self.dequeueReusableCell(
            of: T.self,
            for: sectionController,
            at: index
        ) as? T else {
            fatalError()
        }

        return cell
    }

    /**
     Dequeues a cell from the collection view reuse pool.

     - Parameters:
         - nibName: The name of the nib file.
         - bundle: The bundle in which to search for the nib file. If `nil`, this method searches the main bundle.
         - sectionController: The section controller requesting this information.
         - index: The index of the cell.

     - Returns: A cell dequeued from the reuse pool or a newly created one.

     - Note: This method uses the nib name as the reuse identifier.
     */
    public func dequeueReusableCell<T: UICollectionViewCell>(
        withNibName nibName: String,
        bundle: Bundle?,
        for sectionController: ListSectionController,
        at index: Int
    ) -> T {
        guard let cell = self.dequeueReusableCell(
                withNibName: nibName,
                bundle: bundle,
                for: sectionController,
                at: index
        ) as? T else {
            fatalError("A nib named \"\(nibName)\" was not found in \(bundle)")
        }

        return cell
    }

    /**
     Dequeues a storyboard prototype cell from the collection view reuse pool.

     - Parameters:
         - identifier: The identifier of the cell prototype in storyboard.
         - sectionController: The section controller requesting this information.
         - index: The index of the cell.

     - Returns: A cell dequeued from the reuse pool or a newly created one.
     */
    public func dequeueReusableCellFromStoryboard<T: UICollectionViewCell>(
        withIdentifier reuseIdentifier: String,
        for sectionController: ListSectionController,
        at index: Int
    ) -> T {
        guard let cell = self.dequeueReusableCellFromStoryboard(
            withIdentifier: reuseIdentifier,
            for: sectionController,
            at: index
        ) as? T else {
            fatalError("A cell with the identifier \"\(reuseIdentifier)\" was not found in the storyboard")
        }

        return cell
    }
}
