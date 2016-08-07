/**
 * 
 */
package br.com.project.checkskills.repositories.autenticacao;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.project.checkskills.entities.autenticacao.PermissaoEntity;

/**
 * @author LUAN LUCAS
 *
 */
public interface IPermissaoRepository extends JpaRepository<PermissaoEntity, Long> {
	
	

}
